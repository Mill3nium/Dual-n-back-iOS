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
            if vm.orientation.isPortrait{
                VStack{
                    BoardView()
                        .padding()
                    
                    ButtonsView()
                }
            } else if vm.orientation.isLandscape {
                HStack{
                    VStack{
                        ButtonsView()
                    }
                    .frame(width: 300, height: 300, alignment: .center)
                    
                    BoardView()
                    
                }
            }
        }
    }
}

