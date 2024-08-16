import SwiftUI

@main
struct DoNotTouchTestAppApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
