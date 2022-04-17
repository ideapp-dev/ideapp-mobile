//
//  lesson.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 4.03.2022.
//

import Foundation

struct SingleLesson: Encodable, Identifiable {
    let id: String
    let name: String
    let credit: Int
    let faculty: String
    let semester: String
    let instructor: String
    let time: [Int:Int]
    
}
