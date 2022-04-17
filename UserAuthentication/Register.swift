//
//  Register.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 18.03.2022.
//

import SwiftUI
import BCryptSwift

//MARK: - Register
struct Register: View {
    @State var givenName:String = ""
    @State var givenSirname:String = ""
    @State var email:String = ""
    @State var studentId:Int = 0
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
                TextField("givenName",text: $givenName)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                TextField("Surname",text: $givenSirname)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                TextField("Email",text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .textInputAutocapitalization(.never)
                SecureField("Password",text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .textInputAutocapitalization(.never)
                
                if type == 0 {
                    TextField("Student ID",value: $studentId, formatter: NumberFormatter())
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
                }
            }
            
            
            Button(action: {
                
                var username = email.components(separatedBy: "@")[0]
                
                do {
                    let salt = "$2b$12$fDlH7QbAJWGIlledMab6le"
                    let hashed = try BCryptSwift.hashPassword(password, withSalt: salt)
                    
                    if type == 0 { // if student
                        //var entityToInsert: NSDictionary = ["givenName":givenName, "givenSirname": givenSirname, "email": email, "password": password, "student-id": studentId]
                        //manager.registerInstructor(instructor: entityToInsert)
                        var entityToInsert: NSDictionary = ["name":givenName, "sirname": givenSirname, "student_id": studentId ,"email": email, "password": hashed, "lessons_taken":[], "exams":[]]
                        
                        print("Signup with entityToInsert \(entityToInsert)")
                        
                        manager.signup(user: entityToInsert, collection: "students")
                        
                        self.showHomeScreen = true
                        
                        name = givenName
                        sirname = givenSirname
                        
                        UserDefaults.standard.set(true, forKey: "Token")
                        UserDefaults.standard.set(type, forKey: "Type")
                        UserDefaults.standard.set(email, forKey: "Email")
                    } else {
                        var entityToInsert: NSDictionary = ["name":givenName, "sirname": givenSirname, "email": email, "password": hashed, "lessons_given":[]]
                        manager.signup(user: entityToInsert, collection: "Instructor")
                        
                        self.showHomeScreen = true
                        
                        name = givenName
                        sirname = givenSirname
                        
                        UserDefaults.standard.set(true, forKey: "Token")
                        UserDefaults.standard.set(type, forKey: "Type")
                        UserDefaults.standard.set(email, forKey: "Email")
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
