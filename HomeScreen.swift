//
//  HomeScreen.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 18.03.2022.
//

import SwiftUI

//MARK: - Home Screen Lesson
struct HomeScreen: View {
    
    @Binding var showHomeScreen: Bool
    
    @State var showLessons = true
    @State var showEvents = false
    @State var showProfile = false
    
    @State private var selectedTab: Int = 0

    var body: some View {
        
        return Group {
        
            if showLessons == true {
                Lessons(showLessons: $showLessons, showEvents: $showEvents, showProfile: $showProfile, showHomeScreen: $showHomeScreen)
            } else if showEvents == true{
                Events(showLessons: $showLessons, showEvents: $showEvents, showProfile: $showProfile, showHomeScreen: $showHomeScreen)
            }else{
                Profile(showLessons: $showLessons, showEvents: $showEvents, showProfile: $showProfile, showHomeScreen: $showHomeScreen)
            }
        }
    }
}
