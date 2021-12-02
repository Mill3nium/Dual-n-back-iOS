//
//  HistoryView.swift
//  NBack
//
//  Created by Leo Zaki on 2021-11-29.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var vm : NBackVM
    
    @State private var expandedResults = Set<ResultModel>()
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            List(vm.results) { result in
                let visual = result.preferences.visual
                ? "Visual: \(result.visualCorrect)/\(result.visualCorrect+result.visualIncorrect)"
                : ""
                let audio = result.preferences.audio
                ? "Audio: \(result.audioCorrect)/\(result.audioCorrect+result.audioIncorrect)"
                : ""
                let time = formatter.string(from: result.time)
                HStack {
                    VStack {
                        if expandedResults.contains(result) {
                            Text("Time: \(result.time.formatted())")
                            if result.preferences.visual { Text("Visual: \(result.visualCorrect) correct, \(result.visualIncorrect) incorrect") }
                            if result.preferences.audio { Text("Audio: \(result.audioCorrect) correct, \(result.audioIncorrect) incorrect") }
                            Text("N = \(result.preferences.n)")
                            Text("Stimulations = \(result.preferences.stimulations)")
                            Text("Interval = \(result.preferences.interval)")
                        } else {
                            if result.preferences.visual && result.preferences.audio {
                                Text("\(time): \(visual), \(audio)")
                            }
                            else {
                                if result.preferences.visual { Text("\(time): \(visual)") }
                                if result.preferences.audio { Text("\(time): \(audio)") }
                            }
                        }
                    }
                    Spacer()
                    Image(systemName: expandedResults.contains(result) ? "arrow.up.square" : "arrow.down.square.fill")
                }
                .onTapGesture {
                    if expandedResults.remove(result) == nil { expandedResults.insert(result) }
                }
                .animation(.linear(duration: 0.12), value: expandedResults)
            }
            .navigationTitle("History")
        }
        .task{
            vm.reset()
        }
    }
}
