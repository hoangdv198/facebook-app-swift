//
//  AppTestFeatureFacebookApp.swift
//  AppTestFeatureFacebook
//
//  Created by Hoang Dang on 2/1/25.
//

import SwiftUI

@main
struct AppTestFeatureFacebookApp: App {
    // Integrate AppDelegate for Facebook SDK
     @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
