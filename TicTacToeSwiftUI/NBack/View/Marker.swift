//
//  Marker.swift
//  TicTacToeSwiftUI
//
//  Created by Jonas Wåhslén on 2021-11-18.
//

import SwiftUI

struct Marker: View {
    @EnvironmentObject var theViewModel : TicTacToeVM

    var marker : Int
    var id : Int
    
    var onPosition:Bool = false
    
    var body: some View {
        if onPosition == true {
            Rectangle().fill(Color(.white))
                .frame(width: 95, height: 95, alignment: .center)
        } else {
            Rectangle().fill(Color(.orange))
                .frame(width: 95, height: 95, alignment: .center)
        }
    }
}

