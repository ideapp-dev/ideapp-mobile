//
//  Enroll.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 17.04.2022.
//

import SwiftUI

//MARK: - Enroll in a lesson
struct Enroll: View {
    
    @Binding var showEnroll: Bool
    @Binding var updated: Bool
    
    @State var lesson:String = ""
    //@State var manager = DataPost()
    
    let keys = allLessonIdNames.map{$0.key}
    let values = allLessonIdNames.map {$0.value}
    
    
    @State var manager = DataPost()
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Spacer()
            
            Text("Create Lesson")
                .bold()
                .font(.title)
            
            ForEach(keys.indices) {index in
                Button("\(values[index])") {
                    lesson = keys[index]
                    var dayTime: [Int: Int] = [:]
                    dayTime[3] = 2
                    studentLessons.append(SingleLesson(id: "", name: values[index], credit: 3, faculty: "", semester: "", instructor: "", time: dayTime))
                    self.showEnroll = false
                    updated = true
                    
                    manager.enrollToLesson(lesson: lesson)
                    
                }
            }
            
            
            
            Button(action: {
                
                print(lesson)
                self.showEnroll = false
            }, label: {
                HStack {
                    Spacer()
                    Text("Enroll")
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
