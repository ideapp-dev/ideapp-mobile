//
//  ContentView.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 3.02.2022.
//

import SwiftUI
import BCrypt

struct ContentView: View {
    
    init() {
        

        let password = "asdasd"
        do {
            let salt = try BCrypt.Salt()
            let hashed = try BCrypt.Hash(password, salt: salt)
            print("Password is \(password)")
            print("Salt is \(salt)")
            print("Hashed result is: \(hashed)")
        }
        catch {
            print("An error occured: \(error)")
        }
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
