//
//  TextInfo.swift
//  TicTacToeSwiftUI
//
//  Created by Jonas Wåhslén on 2021-11-21.
//

import SwiftUI

struct TextInfo: View {
    @EnvironmentObject var theViewModel : TicTacToeVM
    
    var body: some View {
        switch theViewModel.checkWinner(){
        case 0:
            Text("Play")
                .font(.title)
        case 1:
            Text("Circle has won!")
                .font(.title)
        case 2:
            Text("Cross has won!")
                .font(.title)
        case 3:
            Text("It's a draw!")
                .font(.title)
        default:
            Text("Start Play")
                .font(.title)
        }
    }
}

