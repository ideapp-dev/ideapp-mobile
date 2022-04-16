//
//  Grades.swift
//  ideapp-mobile
//
//  Created by Atahan Ünal on 3/27/22.
//

import SwiftUI

//MARK: - Show student grades
struct Grades: View {
    
    var lessonName: String
    @Binding var presentedAsModal: Bool
    
    var body: some View {
        VStack{
            
            VStack (alignment: .leading){
                HStack {
                    Spacer()
                    Text("\(lessonName)")
                        .font(.system(size: 30))
                        .bold()
                        .padding()
                    Spacer()
                }
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(studentExam) {
                        item in if lessonName == lessonIdName[item.lesson_id] {
                            
                            ScrollView(){
                                ZStack{
                                    VStack (alignment: .leading){
                                        
                                        VStack(alignment: .leading){
                                            Text("\(item.name)  ").font(.headline).bold()
                                            
                                            Spacer()
                                            
                                            Text("Dates: ").font(.headline).bold()
                                            Text("from: \(item.start_time)")
                                            Text("to: \(item.end_time)")
                                            
                                            
                                        }
                                        
                                        Spacer()
                                        Spacer()
                                        
                                        VStack(alignment: .leading){
                                            
                                            Text("Your score: ").font(.headline).bold()
                                            
                                            VStack(alignment: .leading){
                                                ForEach(0..<item.score.count) { i in
                                                Text("Q\(i): \(item.score[i])")
                                                Divider()
                                              }
                                            }
                                            
                                            Spacer()
                                            Spacer()
                                            
                                            Text("Questions: ").font(.headline).bold()
                                            VStack(alignment: .leading){
                                                ForEach(0..<item.questions.count) { i in
                                                Text("Q\(i): \(item.questions[i])")
                                                Divider()
                                              }
                                            }
                                            
                                            Spacer()
                                            Spacer()
                                            
                                            Text("Answers:").font(.headline).bold()
                                            VStack(alignment: .leading){
                                                ForEach(0..<item.answers.count) { i in
                                                Text("Q\(i): \(item.answers[i])")
                                                Divider()
                                              }
                                            }
                                        }
                                        
        
                                    
                                    }.padding()
                                }
                            }
                        }
                    }
                }
                
            }
            
            Button(action: {
                self.presentedAsModal = false
            }, label: {
                HStack {
                    Spacer()
                    Text("Dismiss")
                        .foregroundColor(.white)
                    Spacer()
                }.padding()
                    .background(Color.blue)
                    .cornerRadius(5.0)
            }).padding()
        }
    }
}


