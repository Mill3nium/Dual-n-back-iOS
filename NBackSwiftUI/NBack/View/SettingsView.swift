//
//  SettingsView.swift
//  NBack
//
//  Created by Leo Zaki on 2021-11-29.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var vm : NBackVM
    
    @State var isAudio:Bool = false
    @State var isVisual:Bool = false
    // TODO: Persist settings
    @State private var number = 1
    @State private var time = 1
    
    var body: some View {
        NavigationView {
            VStack{
                Form{
                    Section{
                        Toggle("Audio", isOn: $isAudio)
                        Toggle("Visual", isOn: $isVisual)
                        Stepper(value: $number, in: 1...10,step: 1){
                            Text("Number of events in a round: \(number)")
                                .font(.system(size: 14))
                        }
                        Stepper(value: $time, in: 1...10,step: 1){
                            Text("Time between events: \(time) (sec)")
                                .font(.system(size: 14))
                        }
                    }
                }
            }.navigationTitle("Settings")
        }
        .task{
            // Cancel ongoing game
            vm.playing = false
        }
        
    }
}
