import SwiftUI

@main
struct NBackApp: App {
    @StateObject private var theViewModel = NBackVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(theViewModel)
        }
    }
}
