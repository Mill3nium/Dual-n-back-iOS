//
//  GameView.swift
//  NBack
//
//  Created by Leo Zaki on 2021-11-29.
//

import Foundation
import SwiftUI

struct GameView: View {
    @EnvironmentObject var vm : NBackVM
    
    var body: some View {
        Group {
            if vm.orientation.isPortrait {
                VStack{
                    resultTexts
                    
                    BoardView()
                        .padding()
                    ButtonsView()
                }
            } else if vm.orientation.isLandscape {
                HStack{
                    VStack{
                        resultTexts
                        
                        ButtonsView()
                    }
                    .frame(width: 300, height: 300, alignment: .center)
                    
                    BoardView()
                }
            }
        }
    }
    
    var resultTexts: some View {
        Group {
            if vm.newScore == nil && vm.results.count >= 1 {
                let text = "Previous: \(vm.results[0])"
                Text(text)
            }
            else if vm.newScore != nil && vm.results.count >= 2 {
                let text = "Previous: \(vm.results[1])"
                Text(text)
            }
            
            if vm.newScore != nil {
                let text = "New: \(vm.newScore!)"
                Text(text)
            }
        }
    }
}
