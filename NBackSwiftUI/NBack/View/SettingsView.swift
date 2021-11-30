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
    
    var body: some View {
        NavigationView {
            VStack{
                Form{
                    Section{
                        Toggle("Audio", isOn: $isAudio).onChange(of: isAudio) { newValue in
                            vm.theSettingsModel.visualStimuli = self.isVisual
                            vm.theSettingsModel.audioStimuli = self.isAudio
                            vm.saveSettingsToUD()
                        }
                        Toggle("Visual", isOn: $isVisual).onChange(of: isVisual) { newValue in
                            vm.theSettingsModel.visualStimuli = self.isVisual
                            vm.theSettingsModel.audioStimuli = self.isAudio
                            vm.saveSettingsToUD()
                        }
                    }.onAppear{
                        vm.loadSettingsFromUD()
                        self.isAudio = vm.theSettingsModel.audioStimuli
                        self.isVisual = vm.theSettingsModel.visualStimuli
                    }
                    
                    Stepper(value: $vm.theSettingsModel.numberOfEvents, in: 1...10,step: 1){
                        Text("Number of events in a round: \(vm.theSettingsModel.numberOfEvents)")
                            .font(.system(size: 14))
                    }.onChange(of: vm.theSettingsModel.numberOfEvents) { newValue in
                        print("saving number of events!")
                        vm.saveSettingsToUD()
                    }
                    Stepper(value: $vm.theSettingsModel.timeBetweenEvents, in: 1...10,step: 1){
                        Text("Time between events: \(vm.theSettingsModel.timeBetweenEvents) (sec)")
                            .font(.system(size: 14))
                    }.onChange(of: vm.theSettingsModel.timeBetweenEvents) { newValue in
                        print("Saving time between events")
                        vm.saveSettingsToUD()
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
