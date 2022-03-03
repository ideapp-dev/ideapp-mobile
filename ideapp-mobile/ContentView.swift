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

//MARK: - Objects

var name:String = ""
var sirname:String = ""
var email:String = ""
var studentId:String = ""
var password:String = ""

var studentEvents: [SingleEvent] = []
var dayNumber: Int = 1

var type = 0


//MARK: - Home Screen Lesson
struct HomeScreen: View {
    
    @Binding var showHomeScreen: Bool
    
    var type: Int = 0
     
    
    var body: some View {
        
    
        
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
                    item in if item.time[dayNumber] != nil{Text(item.name)}
                    
                }
            }
            Section(header: Text("Tomorrow"))
            {
                ForEach(studentEvents) {
                    item in if item.time[dayNumber+1] != nil{Text(item.name)}
                }
            }
        }
        

        
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
        
        
        

        
    }
}

//MARK: - Create Lesson
struct CreateLesson: View {
    @State var name:String = ""
    @State var credit:Int = 0
    @State var faculty:String = ""
    @State var semester:String = ""
    @State var instructor:String = ""
    @State var time: [Int:Int] = [:]
    
    @State var time11:Bool = false ;
    @State var time21:Bool = false ;
    @State var time31:Bool = false ;
    @State var time41:Bool = false ;
    @State var time51:Bool = false ;
    @State var time61:Bool = false ;
    
    @State var timeSelected: [[Bool]] = [[false, false, false, false, false, false, false],
                                         [false, false, false, false, false, false, false],
                                         [false, false, false, false, false, false, false],
                                         [false, false, false, false, false, false, false],
                                         [false, false, false, false, false, false, false],
                                         [false, false, false, false, false, false, false],
                                         [false, false, false, false, false, false, false]
    ]
    
    @Binding var showLogin: Bool
    @Binding var showHomeScreen: Bool
    
    @State var manager = DataPost()
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Spacer()
            
            Text("Create Lesson")
                .bold()
                .font(.title)
            
            
            
            VStack{
                TextField("Name",text: $name)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                TextField("Credit",value: $credit, formatter: NumberFormatter())
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                TextField("Faculty",text: $faculty)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                TextField("Semester",text: $semester)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                TextField("Instructor",text: $instructor)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
            }
            
            VStack{
                
                
                
                HStack{
                    VStack(spacing: 17){
                        Text(" ")
                        Text("08:30-10:20")
                        Text("10:30-12:20")
                        Text("12:30-14:20")
                        Text("14:30-16:20")
                        Text("16:30-18:20")
                        Text("18:30-20:20")
                    }
                    
                    VStack{
                        Text("Mon")
                        
                        Button(action:
                                {
                            //1. Save state
                            //self.time11 = !self.time11
                            self.timeSelected[1][1] = !self.timeSelected[1][1]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[1][1] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[1][2] = !self.self.timeSelected[1][2]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[1][2] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[1][3] = !self.self.timeSelected[1][3]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[1][3] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[1][4] = !self.self.timeSelected[1][4]
                            
                            
                        }) {

                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[1][4] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[1][5] = !self.self.timeSelected[1][5]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[1][5] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                                
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[1][6] = !self.self.timeSelected[1][6]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[1][6] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                    }
                    
                    VStack{
                        Text("Tue")
                        
                        Button(action:
                                {
                            //1. Save state
                            //self.time11 = !self.time11
                            self.timeSelected[2][1] = !self.timeSelected[2][1]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[2][1] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[2][2] = !self.self.timeSelected[2][2]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[2][2] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[2][3] = !self.self.timeSelected[2][3]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[2][3] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[2][4] = !self.self.timeSelected[2][4]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[2][4] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[2][5] = !self.self.timeSelected[2][5]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[2][5] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[2][6] = !self.self.timeSelected[2][6]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[2][6] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                    }
                    
                    VStack{
                        Text("Wed")
                        
                        Button(action:
                                {
                            //1. Save state
                            //self.time11 = !self.time11
                            self.timeSelected[3][1] = !self.timeSelected[3][1]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[3][1] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[3][2] = !self.self.timeSelected[3][2]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[3][2] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[3][3] = !self.self.timeSelected[3][3]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[3][3] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[3][4] = !self.self.timeSelected[3][4]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[3][4] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[3][5] = !self.self.timeSelected[3][5]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[3][5] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[3][6] = !self.self.timeSelected[3][6]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[3][6] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                    }
                    
                    VStack{
                        Text("Thu")
                        
                        Button(action:
                                {
                            //1. Save state
                            //self.time11 = !self.time11
                            self.timeSelected[4][1] = !self.timeSelected[4][1]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[4][1] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[4][2] = !self.self.timeSelected[4][2]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[4][2] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[4][3] = !self.self.timeSelected[4][3]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[4][3] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[4][4] = !self.self.timeSelected[4][4]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[4][4] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[4][5] = !self.self.timeSelected[4][5]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[4][5] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[4][6] = !self.self.timeSelected[4][6]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[4][6] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                    }
                    
                    VStack{
                        Text("Fri")
                        
                        Button(action:
                                {
                            //1. Save state
                            //self.time11 = !self.time11
                            self.timeSelected[5][1] = !self.timeSelected[5][1]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[5][1] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[5][2] = !self.self.timeSelected[5][2]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[5][2] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[5][3] = !self.self.timeSelected[5][3]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[5][3] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[5][4] = !self.self.timeSelected[5][4]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[5][4] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[5][5] = !self.self.timeSelected[5][5]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[5][5] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[5][6] = !self.self.timeSelected[5][6]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[5][6] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                    }
                    
                    VStack{
                        Text("Sat")
                        
                        Button(action:
                                {
                            //1. Save state
                            //self.time11 = !self.time11
                            self.timeSelected[6][1] = !self.timeSelected[6][1]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[6][1] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[6][2] = !self.self.timeSelected[6][2]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[6][2] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[6][3] = !self.self.timeSelected[6][3]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[6][3] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[6][4] = !self.self.timeSelected[6][4]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[6][4] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[6][5] = !self.self.timeSelected[6][5]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[6][5] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[6][6] = !self.self.timeSelected[6][6]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[6][6] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                    }
                }
                
                
            }
            
            
            Button(action: {
                
                var entityToInsert: NSDictionary = ["name":name, "credit": credit, "faculty": faculty, "semester": semester, "instructor":instructor, "time":time]
                manager.createLesson(lesson: entityToInsert)
                
                self.showHomeScreen = true
            }, label: {
                HStack {
                    Spacer()
                    Text("Create")
                        .foregroundColor(.white)
                    Spacer()
                }.padding()
                    .background(Color.blue)
                    .cornerRadius(5.0)
            })
            
            Spacer()
        }.padding()
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
                    defaults.set(true, forKey: "Token")
                    defaults.set(type, forKey: "Type")
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
                        var entityToInsert: NSDictionary = ["name":name, "sirname": sirname, "student_id": studentId ,"email": email, "password": hashed]
                        
                        print("Signup with entityToInsert \(entityToInsert)")
                        
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

//MARK: - ContentView
let defaults = UserDefaults.standard

struct NewPage: View {
    
    var exampleString: String = "This is an example string"
    var exampleList: [String] = []
    
    @State var howManyTimesClicked: Int = 0
    
    init(){
        exampleString = "Change its value"
        
        exampleList.append("First")
        exampleList.append("Second")
    }
    
    var body: some View{
        
        // Divides the region into vertical stacks. So output will be like
        // 1
        // 2
        // 3
        VStack{
            Text("VStack example")
            VStack {
                Text("1")
                Text("2")
                Text("3")
            }
        }
        
        Divider()
        
        // Divides the region into horizontal stacks. so output will be
        // 1 2 3
        VStack{
            Text("HStack example")
            HStack {
                Text("1")
                Text("2")
                Text("3")
            }
        }
        
        Divider()
        
        // Showing a list of items are complicated
        // If your array includes basic types like integers or strings, you can do
        VStack{
            Text("Showing List example")
            ForEach(0 ..< exampleList.count, id: \.self) {value in
                        Text("\(value)")
                    }
            
            
        }

        Divider()
        
        VStack{
            Text("Button example")
            
            Button(action: {
                self.howManyTimesClicked += 1
            }, label: {
                HStack {
                    Spacer()
                    Text("Increase the following number")
                        .foregroundColor(.white)
                    Spacer()
                }.padding()
                    .background(Color.blue)
                    .cornerRadius(5.0)
            })
            
            Text("Clicked \(howManyTimesClicked) times")
        }
        

    }
    
}

struct ContentView: View {
    
    // Variables
    @State var showLogin = true
    @State var showHomeScreen = false
    @State var manager = DataPost()
    
    // Write the variables here
    // Do not include @State if you are not going to pass it to a view (page)
    
    init() {
        // Check if the user is already authorized
        var isAuthorized: Bool = defaults.bool(forKey: "Token")
        
        // if so, change the states of login and home screen pages
        if isAuthorized == true{
            _showLogin = State(initialValue: false)
            _showHomeScreen = State(initialValue: true)
            
            manager.retrieveEvents()
        }
        
        // Dates necessary for events
        let date = Date()
        let format = DateFormatter()
        format.locale = Locale(identifier: "us")
        format.dateFormat = "E"
        
        var dateNumbers: [String:Int] = ["Mon":1, "Tue":2, "Wed":3, "Thu":4, "Fri":5, "Sat":6, "Sun":7]
        let formattedDate = format.string(from: date)

        if let val = dateNumbers[formattedDate] {
            dayNumber = dateNumbers[formattedDate]!
        }
        
        // Write anything that requires an operation before the UI is present
        // This includes all the variable assingments, function calls or so on
        // ...
    }
    
    // You can only do operations that will effect the UI under body. For example, you can't assign a variable a value or call a function
    var body: some View {
        
        // Comment the following and add your page in here
        NewPage()
        
        
        /*
         
         CreateLesson(showLogin: $showLogin, showHomeScreen: $showHomeScreen)
         
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
        */
         
    }
}

//MARK: - DB Operations
class DataPost: ObservableObject {
    var didChange = PassthroughSubject<DataPost, Never>()
    var formCompleted = false {
        didSet {
            didChange.send(self)
        }
    }
    
    @Published var receivedResponse: [String: Any] = [:]
    
    // Boolean values to show if the db operation (such as reading or writing) is finished
    var done = false
    var isAuthorized: Bool = false
    
    var loginDone = false
    var retrieveEventDone: Bool = false
    
    // Write the given dictionary to the db
    func createLesson(lesson: NSDictionary){
        
        let body: [String: Any] = ["collection": "Lesson",
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "document": lesson ]
        
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
    
    // Add the user to the db
    func signup(user: NSDictionary, collection: String){
        
        print("Sending collection \(collection) ")
        
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
    
    // Login the user depending on the inputs given
    func login(user: NSDictionary, collection: String) -> Bool{
        
        let body: [String: Any] = ["collection": collection,
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "filter": ["email": user["email"] ] ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        var receivedHASHDone = ""
        
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
                
                receivedHASHDone = receivedHASH
                
                var givenPassword: String = user["password"] as! String
                
                print("givenPassword \(givenPassword) & receivedHASH \(receivedHASH)")
                
                self.isAuthorized = BCrypt.Check(givenPassword, hashed: receivedHASH)
                print("isAuthorized function \(self.isAuthorized)")
                
            }
            
        }
        
        task.resume()
        
        // Necessary for the program to wait until the whole request is received
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.2))
        } while !loginDone

        
        print("return isAuthorized function \(self.isAuthorized)")
        
        repeat{
            
        } while receivedHASHDone == ""
        
        return isAuthorized
    }
    
    // Retrieve the list of events
    func retrieveEvents(){
        
        let body: [String: Any] = ["collection": "Event",
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "filter": ["owner": "ctest@etu.edu.tr" ]
                                ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        
        
        print("-----> body: \(body)")
        print("-----> jsonData: \(jsonData)")
        
        let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/find")!
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
                self.retrieveEventDone = true
                
                var receivedJSON = responseJSON["documents"] as! [[String:Any]]
                
                for item in receivedJSON{
                    
                    print(" -> item \(item)")
                    
                    var eventName: String = item["name"] as! String
                    var eventId: String = item["_id"] as! String
                    
                    print(" -> name \(eventName)")
                    
                    var eventTime: [String:NSNumber] = item["time"] as! [String:NSNumber]
                    
                    var day:Int = 0
                    var time:Int = 0
                    
                    for (key, value) in eventTime {
                        print("key: \(key) & value: \(value)")
                        
                        day = (key as NSString).integerValue
                        time = value.intValue

                    }
                    
                    studentEvents.append(SingleEvent(id: eventId,name: eventName, time: [day:time]))
                }
                
                print("retrieveEvents \(receivedJSON)")
                print("studentEvents \(studentEvents)")
                
            }
            
        }
        
        task.resume()
        
        
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.2))
        } while !retrieveEventDone

    }
}
