//
//  event.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 15.02.2022.
//

import Foundation

struct SingleEvent: Encodable, Identifiable {
    let id: String
    let name: String
    let time: [Int:Int]
    
}
