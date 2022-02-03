//
//  ContentView.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 3.02.2022.
//

import SwiftUI
import BCrypt

struct Login: View {
    @State var username:String = ""
    @State var password:String = ""
    
    @State private var type = 0
    
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
            

            
            TextField("Username",text: $username)
              .padding()
              .background(Color(.systemGray6))
              .cornerRadius(5.0)
            SecureField("Password",text: $password)
              .padding()
              .background(Color(.systemGray6))
              .cornerRadius(5.0)
            
            Button(action: {}, label: {
              HStack {
                Spacer()
                Text("Login")
                   .foregroundColor(.white)
                Spacer()
                }.padding()
                 .background(Color.blue)
                 .cornerRadius(5.0)
            })
            
            Button(action: {}, label: {
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

struct Register: View {
    @State var name:String = ""
    @State var sirname:String = ""
    @State var email:String = ""
    @State var studentId:String = ""
    @State var password:String = ""
    
    @State private var type = 0
    
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
            
            if type == 0 {
                TextField("Student ID",text: $studentId)
                  .padding()
                  .background(Color(.systemGray6))
                  .cornerRadius(5.0)
            }
            
            Button(action: {}, label: {
              HStack {
                Spacer()
                Text("Register")
                   .foregroundColor(.white)
                Spacer()
                }.padding()
                 .background(Color.blue)
                 .cornerRadius(5.0)
            })
            
            Button(action: {}, label: {
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
    
    init() {
        

        let password = "asdasd"
        do {
            let salt = try BCrypt.Salt()
            let hashed = try BCrypt.Hash(password, salt: salt)
            print("Password is \(password)")
            print("Salt is \(salt)")
            print("Hashed result is: \(hashed)")
        }
        catch {
            print("An error occured: \(error)")
        }
    }
    

    var body: some View {
        Register()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
