//
//  Events.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 18.03.2022.
//

import SwiftUI


//MARK: - Show Event

struct Events: View {
    
    @Binding var showLessons: Bool
    @Binding var showEvents: Bool
    @Binding var showProfile: Bool
    
    @Binding var showHomeScreen: Bool
    
    @State var showCreateEvent: Bool = false
    @State var updated = false

    
    var body: some View {
        
        VStack{
            VStack (alignment: .leading){
                Text("Your events")
                    .font(.system(size: 30))
                    .bold()
                    .padding()
            }
        
            
            List {
                
                Section(header: Text("Today"))
                {
                    ForEach(studentEvents) {
                        item in if item.time["\(dayNumber)"] != nil{
                            Button {
                                print("Button pressed")
                                studentEvents = studentEvents.filter { $0.name != item.name }
                                self.updated = true
                                
                            } label: {
                                Text("\(item.name) at \(timeEnum[item.time["\(dayNumber)"]!]!)")
                            }
                            .contentShape(Rectangle())
                        }
                        
                    }
                }
                Section(header: Text("Tomorrow"))
                {
                    ForEach(studentEvents) {
                        item in if item.time["\(dayNumber+1)"] != nil{
                            Button {
                                print("Button pressed")
                                studentEvents = studentEvents.filter { $0.name != item.name }
                                self.updated = true
                                
                            } label: {
                                Text("\(item.name) at \(timeEnum[item.time["\(dayNumber+1)"]!]!)")
                            }
                            .contentShape(Rectangle())
                        }
                    }
                }
                
            }
            
            if updated {
                Text("")
            }
            
            
            HStack{
                Button(action: {
                    self.showCreateEvent = true
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
                .sheet(isPresented: $showCreateEvent, content: {
                            CreateEvent(showCreateEvent: $showCreateEvent, updated: $updated)
                }).padding()
            }

                        

            Spacer()

            
            /*
            Button(action: {
                
                    }, label: {
                HStack {
                    Spacer()
                    Text("Create Event")
                        .foregroundColor(.white)
                    Spacer()
                }.padding()
                    .background(Color.blue)
                    .cornerRadius(5.0)
                    }).padding()
            */
            
            

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


