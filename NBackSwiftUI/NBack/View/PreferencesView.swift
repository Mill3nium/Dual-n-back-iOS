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
    
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    Section("Modes") {
                        Toggle("Audio", isOn: $vm.preferences.audio).onChange(of: vm.preferences.audio) { _ in
                            if !vm.preferences.audio && !vm.preferences.visual { vm.preferences.visual = true }
                            vm.preferences.save()
                        }
                        Toggle("Visual", isOn: $vm.preferences.visual).onChange(of: vm.preferences.visual) { _ in
                            if !vm.preferences.audio && !vm.preferences.visual { vm.preferences.audio = true }
                            vm.preferences.save()
                        }
                    }
                    Section("Stimulations") {
                        Stepper(
                            "N: \(vm.preferences.n)",
                            value: $vm.preferences.n,
                            in: 1...vm.preferences.stimulations
                        ) {_ in vm.preferences.save() }
                        Stepper(
                            "Amount: \(vm.preferences.stimulations)",
                            value: $vm.preferences.stimulations,
                            in: 1...100
                        ) {_ in vm.preferences.save() }
                        Stepper(
                            "Interval: \(vm.preferences.interval) seconds",
                            value: $vm.preferences.interval,
                            in: 1...10
                        ) {_ in vm.preferences.save() }
                    }
                }
            }.navigationTitle("Settings")
        }
        .task {
            vm.reset()
        }
        
    }
}
