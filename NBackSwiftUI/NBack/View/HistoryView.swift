//
//  HistoryView.swift
//  NBack
//
//  Created by Leo Zaki on 2021-11-29.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var vm : NBackVM
    
    @State var isAudio:Bool = false
    @State var isVisual:Bool = false
    
    @State private var number = 0
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            VStack{
                Form{
                    Text("Hello Hello")
                    Text("Hello Hello")
                    Text("Hello Hello")
                    Text("Hello Hello")
                    Text("Hello Hello")
                }
            }.navigationTitle("History")
        }
        .task{
            // Cancel ongoing game
            vm.playing = false
        }
        
    }
}
