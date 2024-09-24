//
//  smart_stockerApp.swift
//  smart_stocker
//
//  Created by Fabio A Soares on 22/09/24.
//

import SwiftUI
import Firebase

@main
struct smart_stockerApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SpashScreen()
        }
    }
}
