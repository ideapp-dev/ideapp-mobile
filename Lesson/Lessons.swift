//
//  Lessons.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 18.03.2022.
//

import SwiftUI


//MARK: - Show student lessons
struct Lessons: View {
    
    @Binding var showLessons: Bool
    @Binding var showEvents: Bool
    @Binding var showProfile: Bool
    
    @State var updated = false
    
    @Binding var showHomeScreen: Bool
    @State var presentingModal = false
    @State var showEnroll = false
    @State var showCreateLesson = false
    
    var body: some View {
        VStack{
            VStack (alignment: .leading){
                HStack {
                    Spacer()
                    Text("Your lessons")
                        .font(.system(size: 30))
                        .bold()
                        .padding()
                    Spacer()
                }
            }
            
            
            List {
                
                Section(header: Text("Monday"))
                {
                    
                    ForEach(studentLessons) {
                        item in if item.time[1] != nil{
                            Button("\(item.name) at \(timeEnum[item.time[1]!]!)") {
                                self.presentingModal = true
                                
                            }
                            .sheet(isPresented: $presentingModal) {
                                Grades(lessonName: item.name, presentedAsModal: self.$presentingModal) }
                        }
                    }
                }
                
                Section(header: Text("Tuesday"))
                {
                    
                    ForEach(studentLessons) {
                        item in if item.time[2] != nil{
                            
                            Button("\(item.name) at \(timeEnum[item.time[2]!]!)") {
                                self.presentingModal = true
                                
                            }
                            .sheet(isPresented: $presentingModal) {
                                Grades(lessonName: item.name, presentedAsModal: self.$presentingModal) }
                        }
                    }
                }

                
                Section(header: Text("Wednesday"))
                {
                    
                    ForEach(studentLessons) {
                        item in if item.time[3] != nil{
                            
                            Button("\(item.name) at \(timeEnum[item.time[3]!]!)") {
                                self.presentingModal = true
                                
                            }
                            .sheet(isPresented: $presentingModal) {
                                Grades(lessonName: item.name, presentedAsModal: self.$presentingModal) }
                        }
                    }
                }


                Section(header: Text("Thursday"))
                {
                    ForEach(studentLessons) {
                        item in if item.time[4] != nil{
                            
                            Button("\(item.name) at \(timeEnum[item.time[4]!]!)") {
                                self.presentingModal = true
                                
                            }
                            .sheet(isPresented: $presentingModal) {
                                Grades(lessonName: item.name, presentedAsModal: self.$presentingModal) }

                        }
                    }
                }
                Section(header: Text("Friday"))
                {
                    ForEach(studentLessons) {
                        item in if item.time[5] != nil{
                            
                            Button("\(item.name) at \(timeEnum[item.time[5]!]!)") {
                                self.presentingModal = true
                                
                            }
                            .sheet(isPresented: $presentingModal) {
                                Grades(lessonName: item.name, presentedAsModal: self.$presentingModal) }
                                
                        }
                    }
                }

            }
            
            if (UserDefaults.standard.integer(forKey: "Type") == 0){
                Button(action: {
                    self.showEnroll = true
                        }) {
                            HStack {
                                Spacer()
                                Text("Enroll")
                                    .foregroundColor(.white)
                                Spacer()
                            }.padding()
                                .background(Color.blue)
                                .cornerRadius(5.0)
                        }
                .sheet(isPresented: $showEnroll, content: {
                    Enroll(showEnroll: $showEnroll, updated: $updated, lesson: "")
                }).padding()
            }else{
                Button(action: {
                    self.showCreateLesson = true
                        }) {
                            HStack {
                                Spacer()
                                Text("Create")
                                    .foregroundColor(.white)
                                Spacer()
                            }.padding()
                                .background(Color.blue)
                                .cornerRadius(5.0)
                        }
                .sheet(isPresented: $showCreateLesson, content: {
                    CreateLesson(showCreateLesson: $showCreateLesson)
                }).padding()
            }



            Spacer()
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
        }
    }
}
