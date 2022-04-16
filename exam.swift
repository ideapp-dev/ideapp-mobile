//
//  lesson.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 4.03.2022.
//

import Foundation

struct SingleExam: Encodable, Identifiable {
    let id: String
    let lesson_id: String
    let questions: [String]
    let answers: [String]
    let score: [String]
    let name: String
    let start_time: String
    let end_time: String
    
}
