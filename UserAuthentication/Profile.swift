//
//  Profile.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 18.03.2022.
//

import SwiftUI

//MARK: - Profile
struct Profile: View{
    
    @Binding var showLessons: Bool
    @Binding var showEvents: Bool
    @Binding var showProfile: Bool
    
    @Binding var showHomeScreen: Bool
    
    @State var updated: Bool = false
    
    var body: some View {
        
        VStack {
            
            VStack (alignment: .leading){
                if type == 0{
                    Text("Student")
                        .font(.system(size: 30))
                        .bold()
                        .padding()
                }else{
                    Text("Instructor")
                        .font(.system(size: 30))
                        .bold()
                        .padding()
                }
                
            }
            
            VStack {
                HStack {
                    Text("Name").bold()
                    Spacer()
                    Text("\(name)")
                }.padding([.leading, .trailing], 20)
                
                HStack {
                    Text("Surname").bold()
                    Spacer()
                    Text("\(sirname)")
                }.padding([.leading, .trailing], 20)
                
                HStack {
                    Text("Email").bold()
                    Spacer()
                    Text("\(UserDefaults.standard.string(forKey: "Email")!)")
                }.padding([.leading, .trailing], 20)
                
                if type == 0 {
                    HStack {
                        Text("Student ID").bold()
                        Spacer()
                        Text("\(studentId)")
                    }.padding([.leading, .trailing], 20)
                }
                
                
                Spacer()
                
                Button(action: {
                        UserDefaults.standard.set(false, forKey: "Token")
                        UserDefaults.standard.set("", forKey: "Email")
                    
                        showHomeScreen = false
                    
                        updated = false
                                
                        }, label: {
                    HStack {
                        Spacer()
                        Text("Logout")
                            .foregroundColor(.white)
                        Spacer()
                    }.padding()
                        .background(Color.blue)
                        .cornerRadius(5.0)
                        }).padding()

            }.toolbar {
                // 2.
                ToolbarItem(placement: .bottomBar) {
                    // 3.
                    HStack() {
                        
                        Button(action: {
                            self.showEvents = false
                            self.showLessons = true
                            self.showProfile = false
                        }, label: {
                            HStack {
                                Spacer()
                                Image(systemName: "text.book.closed")
                                Text("Lessons")
                                    .foregroundColor(.blue)
                                Spacer()
                            }.cornerRadius(5.0)
                        })
                        
                        Button(action: {
                            self.showEvents = true
                            self.showLessons = false
                            self.showProfile = false
                        }, label: {
                            HStack {
                                Spacer()
                                Image(systemName: "calendar")
                                Text("Events")
                                    .foregroundColor(.blue)
                                Spacer()
                            }.cornerRadius(5.0)
                        })
                        Button(action: {
                            self.showEvents = false
                            self.showLessons = false
                            self.showProfile = true
                        }, label: {
                            HStack {
                                Spacer()
                                Image(systemName: "person.crop.circle")
                                Text("Profile")
                                    .foregroundColor(.blue)
                                Spacer()
                            }.cornerRadius(5.0)
                        })
                        
                        
                    }
                }
            }.padding(.top, 20)
        }

    }
}
