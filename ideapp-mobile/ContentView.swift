//
//  ContentView.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 3.02.2022.
//

import SwiftUI
import BCrypt

import Foundation
import Combine

struct HomeScreen: View {
    
    @Binding var showHomeScreen: Bool
    
    var body: some View {
        Text("Home Screen")
    }
}

//MARK: - Login
struct Login: View {
    
    
    
    @State var email:String = ""
    @State var password:String = ""
    
    @State private var type = 0
    
    @Binding var showLogin: Bool
    @Binding var showHomeScreen: Bool
    @State var manager = DataPost()
    
    var body: some View {
        
        
        VStack(spacing: 10) {
            
            Spacer()
            
            Text("Login")
                .bold()
                .font(.title)
            
            Picker("Your status?", selection: $type) {
                Text("Student").tag(0)
                Text("Instructor").tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
            
            
            
            TextField("Mail",text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
            SecureField("Password",text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
            
            Button(action: {
                //var username = email.components(separatedBy: "@")[0]
                
                var currentCollection: String = "students"
                
                if type == 1 {
                    currentCollection = "Instructor"
                }
                
                var entityToInsert: NSDictionary = ["email":email, "password": password]
                var isAuthorized = manager.login(user: entityToInsert, collection: currentCollection)
                
                print("Result of isAuthorized is \(isAuthorized)")
                
                if isAuthorized {
                    self.showHomeScreen = true
                }
                
            }, label: {
                HStack {
                    Spacer()
                    Text("Login")
                        .foregroundColor(.white)
                    Spacer()
                }.padding()
                    .background(Color.blue)
                    .cornerRadius(5.0)
            })
            
            Button(action: {
                self.showLogin = false
            }, label: {
                HStack {
                    Spacer()
                    Text("Sign up")
                        .foregroundColor(.blue)
                    Spacer()
                }.padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
            })
            
            Spacer()
        }.padding()
    }
}

//MARK: - Register
struct Register: View {
    @State var name:String = ""
    @State var sirname:String = ""
    @State var email:String = ""
    @State var studentId:String = ""
    @State var password:String = ""
    
    @State private var type = 0
    
    @Binding var showLogin: Bool
    @Binding var showHomeScreen: Bool
    
    @State var manager = DataPost()
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Spacer()
            
            Text("Register")
                .bold()
                .font(.title)
            
            Picker("Your status?", selection: $type) {
                Text("Student").tag(0)
                Text("Instructor").tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
            
            VStack{
                TextField("Name",text: $name)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                TextField("Surname",text: $sirname)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                TextField("Email",text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                TextField("Password",text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                
                if type == 0 {
                    TextField("Student ID",text: $studentId)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
                }
            }
            
            
            Button(action: {
                
                var username = email.components(separatedBy: "@")[0]
                
                do {
                    let salt = "$2b$12$fDlH7QbAJWGIlledMab6le"
                    let hashed = try BCrypt.Hash(password, salt: salt)
                    
                    if type == 0 { // if student
                        //var entityToInsert: NSDictionary = ["name":name, "sirname": sirname, "email": email, "password": password, "student-id": studentId]
                        //manager.registerInstructor(instructor: entityToInsert)
                        var entityToInsert: NSDictionary = ["name":name, "sirname": sirname, "student-id": studentId ,"email": email, "password": hashed]
                        manager.signup(user: entityToInsert, collection: "students")
                        
                        self.showHomeScreen = true
                    } else {
                        var entityToInsert: NSDictionary = ["name":name, "sirname": sirname, "email": email, "password": hashed]
                        manager.signup(user: entityToInsert, collection: "Instructor")
                        
                        self.showHomeScreen = true
                    }
                }
                catch {
                    print("An error occured: \(error)")
                }
                
                
                
                
            }, label: {
                HStack {
                    Spacer()
                    Text("Register")
                        .foregroundColor(.white)
                    Spacer()
                }.padding()
                    .background(Color.blue)
                    .cornerRadius(5.0)
            })
            
            Button(action: {
                self.showLogin = true
            }, label: {
                HStack {
                    Spacer()
                    Text("Login")
                        .foregroundColor(.blue)
                    Spacer()
                }.padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
            })
            
            Spacer()
        }.padding()
    }
}

struct ContentView: View {
    
    @State var showLogin = true
    @State var showHomeScreen = false
    
    @State var manager = DataPost()
    
    init() {
    }
    
    
    var body: some View {
        return Group {
                
            

                if showLogin == true && showHomeScreen == false {
                    Login(showLogin: $showLogin, showHomeScreen: $showHomeScreen)
                }
                else if showLogin == false && showHomeScreen == false{
                    Register(showLogin: $showLogin, showHomeScreen: $showHomeScreen)
                }else{
                    HomeScreen(showHomeScreen: $showHomeScreen)
                }

            
            
        }
    }
}

class DataPost: ObservableObject {
    var didChange = PassthroughSubject<DataPost, Never>()
    var formCompleted = false {
        didSet {
            didChange.send(self)
        }
    }
    
    @Published var receivedResponse: [String: Any] = [:]
    
    var done = false
    var isAuthorized: Bool = false
    
    var loginDone = false
    var receivedHASHDone = ""
    
    func signup(user: NSDictionary, collection: String){
        
        let body: [String: Any] = ["collection": collection,
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "document": user ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/insertOne")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
        request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")
        request.httpBody = jsonData
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print("-----> data: \(data)")
            print("-----> error: \(error)")
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print("-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                print("-----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                self.done = true
            }
            
        }
        
        task.resume()
    }
    
    //
    
    func login(user: NSDictionary, collection: String) -> Bool{
        
        let body: [String: Any] = ["collection": collection,
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "filter": ["email": user["email"] ] ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        print("-----> user: \(user)")
        print("-----> body: \(body)")
        print("-----> jsonData: \(jsonData)")
        
        let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/findOne")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
        request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")
        request.httpBody = jsonData
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print("-----> data: \(data)")
            print("-----> error: \(error)")
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print("-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                print("-----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                self.loginDone = true
                
                var receivedJSON = responseJSON["document"] as! [String:Any]
                var receivedHASH: String = receivedJSON["password"] as! String
                
                self.receivedHASHDone = receivedHASH
                
                var givenPassword: String = user["password"] as! String
                
                print("givenPassword \(givenPassword) & receivedHASH \(receivedHASH)")
                
                self.isAuthorized = BCrypt.Check(givenPassword, hashed: receivedHASH)
                print("isAuthorized function \(self.isAuthorized)")
                
            }
            
        }
        
        task.resume()
        
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.2))
        } while !loginDone
        
        while receivedHASHDone == "" {
            
        }
        
        print("return isAuthorized function \(self.isAuthorized)")
        
        return isAuthorized
    }
}
