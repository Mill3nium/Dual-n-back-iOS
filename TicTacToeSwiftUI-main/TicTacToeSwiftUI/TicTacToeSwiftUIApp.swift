//
//  TicTacToeSwiftUIApp.swift
//  TicTacToeSwiftUI
//
//  Created by Jonas Wåhslén on 2021-11-18.
//

import SwiftUI

@main
struct TicTacToeSwiftUIApp: App {
    @StateObject private var theViewModel = TicTacToeVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(theViewModel)
        }
    }
}
