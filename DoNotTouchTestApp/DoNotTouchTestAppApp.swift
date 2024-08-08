//
//  DoNotTouchTestAppApp.swift
//  DoNotTouchTestApp
//
//  Created by 伊佐治恵介 on 2024/08/08.
//

import SwiftUI

@main
struct DoNotTouchTestAppApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
