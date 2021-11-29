//
//  HistoryView.swift
//  NBack
//
//  Created by Leo Zaki on 2021-11-29.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var vm : NBackVM
    
    var body: some View {
        List {
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
        }
        .task{
            // Cancel ongoing game
            vm.playing = false
        }
    }
}
