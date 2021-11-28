//
//  ContentView.swift
//  TicTacToeSwiftUI
//
//  Created by Jonas Wåhslén on 2021-11-18.
//

import SwiftUI

// Our custom view modifier to track rotation and
// call our action
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}



struct ContentView: View {
    @EnvironmentObject var theViewModel : TicTacToeVM
    @State private var orientation = UIDeviceOrientation.portrait

    var body: some View {
        Group{
            if orientation.isPortrait{
                VStack{
                    TextInfo().padding()
                    
                    BoardView()
                    
                    Button {
                        theViewModel.resetGame()
                    } label: {
                        Text("Reset")
                    }
                    .padding()
                    
                }
                            
            } else if orientation.isLandscape {
                HStack{
                    VStack{
                        TextInfo().padding()
                        
                        Button {
                            theViewModel.resetGame()
                        } label: {
                            Text("Reset")
                        }
                        .padding()
                    }
                    .frame(width: 300, height: 300, alignment: .center)
                    
                    BoardView()
                    
                }
            }
        }
        .onRotate { newOrientation in orientation = newOrientation}
        
        
        
        
    }
}

