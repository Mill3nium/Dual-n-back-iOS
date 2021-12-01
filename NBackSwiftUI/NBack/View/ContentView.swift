
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm : NBackVM
    
    var body: some View {
        TabView {
            GameView().tabItem{
                Image(systemName: "gamecontroller")
                Text("N-Back")
            }
            SettingsView().tabItem{
                Image(systemName: "gear")
                Text("Settings")
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            vm.orientation = UIDevice.current.orientation
            // Sometimes orientation cannot be determined
            if(vm.orientation == UIDeviceOrientation.unknown) {
                vm.orientation = UIDeviceOrientation.portrait
            }
        }
    }
}
