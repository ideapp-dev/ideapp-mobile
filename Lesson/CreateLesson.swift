//
//  CreateLesson.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 18.03.2022.
//

import SwiftUI


struct CreateLesson: View {
    @Binding var showCreateLesson: Bool
    
    @State var name:String = ""
    @State var code: String = ""
    @State var credit:Int = 0
    @State var faculty:String = ""
    @State var semester:String = ""
    
    @State var time: [String:Int] = [:]
    
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
                TextField("Code",text: $code)
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
                
                for i in 1..<7{
                    for j in 1..<7{
                        if timeSelected[i][j] == true {
                            time["\(i)"] = j
                        }
                    }
                }
                
                var entityToInsert: NSDictionary = ["name":name, "code": code, "credit": credit, "faculty": faculty, "semester": semester, "instructor":["$oid":userId] , "time":time]
                manager.createLesson(lesson: entityToInsert)
                
                
                self.showCreateLesson = false
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

