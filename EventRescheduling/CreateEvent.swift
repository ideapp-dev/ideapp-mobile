//
//  CreateEvent.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 18.03.2022.
//

import SwiftUI


//MARK: - Create Event
struct CreateEvent: View {
    
    @Binding var showCreateEvent: Bool
    @Binding var updated: Bool
    

    @State var name:String = ""
    @State var owner:String = ""
    @State var isCompleted:Bool = false
    @State var time: [String:Int] = [:]

    
    @State var timeSelected: [[Bool]] = [[false, false, false, false, false, false, false],
                                         [false, false, false, false, false, false, false],
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
            
            Text("Create Event")
                .bold()
                .font(.title)
            
            
            
            VStack{
                TextField("Name",text: $name)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
            }
            
            VStack{
                
                
                HStack{
                    VStack(spacing: 17){
                        Text(" ")
                        Text("08-10")
                        Text("10-12")
                        Text("12-14")
                        Text("14-16")
                        Text("16-18")
                        Text("18-20")
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
                    
                    VStack{
                        Text("Sun")
                        
                        Button(action:
                                {
                            //1. Save state
                            //self.time11 = !self.time11
                            self.timeSelected[7][1] = !self.timeSelected[7][1]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[7][1] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[7][2] = !self.self.timeSelected[7][2]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[7][2] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[7][3] = !self.self.timeSelected[7][3]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[7][3] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[7][4] = !self.self.timeSelected[7][4]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[7][4] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[7][5] = !self.self.timeSelected[7][5]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[7][5] ? Color.blue : Color.white)
                                                .frame(width: 30, height: 30)
                                                )
                                .frame(width:30, height:30, alignment: .center)
                                .cornerRadius(5)
                        }
                        .foregroundColor(Color.white)
                        
                        Button(action:
                                {
                            //1. Save state
                            self.self.timeSelected[7][6] = !self.self.timeSelected[7][6]
                            
                            
                        }) {
                            Rectangle()
                                .strokeBorder(Color.blue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .fill(self.timeSelected[7][6] ? Color.blue : Color.white)
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
                
                for row in 1..<7 {
                  for column in 1..<8 {
                    print("column: \(column) row: \(row) value:\(timeSelected[column][row])")
                      if timeSelected[column][row] {
                          time["\(column)"] = row
                      }
                  }
                }
                
                var entityToInsert: NSDictionary = ["owner":UserDefaults.standard.string(forKey: "Email")!, "isCompleted":false, "name": name , "time":time]
                
                studentEvents.append(SingleEvent(id: manager.newId, name: name, time: time))
                
                print("entityToInsert :\(entityToInsert)")
                manager.createEvent(event: entityToInsert)
                

                self.updated = true
                
                self.showCreateEvent = false
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
