//
//  Login.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 18.03.2022.
//

import SwiftUI

//MARK: - Login
struct Login: View {
    @State var email:String = ""
    @State var password:String = ""
    
    @State private var type = 0
    
    @Binding var showLogin: Bool
    @Binding var showHomeScreen: Bool
    @State var manager = DataPost()
    
    @State var errorMail = ""
    @State var errorPassword = ""
    
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
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            
            if errorMail != "" {
                Text("\(errorMail)")
            }
            
            SecureField("Password",text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
            
            if errorPassword != "" {
                Text("\(errorPassword)")
            }
            
            Button(action: {
                //var username = email.components(separatedBy: "@")[0]
                
                
                var currentCollection: String = "students"
                
                if type == 1 {
                    currentCollection = "Instructor"
                }
                
                var entityToInsert: NSDictionary = ["email":email, "password": password]
                var isAuthorized = manager.login(user: entityToInsert, collection: currentCollection)
                
                errorMail = manager.errorMessageMail
                errorPassword = manager.errorMessagePassword
                
                manager.errorMessageMail = ""
                manager.errorMessagePassword = ""
                
                print("Result of isAuthorized is \(isAuthorized)")
                
                if isAuthorized {
                    self.showHomeScreen = true
                    UserDefaults.standard.set(true, forKey: "Token")
                    UserDefaults.standard.set(type, forKey: "Type")
                    
                    print("Setting \(email) to the UserDefaults.standard")
                    UserDefaults.standard.set(email, forKey: "Email")
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
