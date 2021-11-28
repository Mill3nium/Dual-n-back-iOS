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
    
    var body: some View {
        Button {
            theViewModel.aMove(position: id)
        } label: {
            if(marker == 1){
                Circle().stroke(Color(.red), lineWidth: 10)
            }else if(marker == 2){
                ZStack{
                    Rectangle()
                        .fill(Color(.gray))
                        .cornerRadius(10)
                        .rotationEffect(Angle(degrees: 45))
                        .frame(width: 10, height: 110, alignment: .center)
                    Rectangle()
                        .fill(Color(.gray))
                        .cornerRadius(10)
                        .rotationEffect(Angle(degrees: 135))
                        .frame(width: 10, height: 110, alignment: .center)
                }
            }else{
                Rectangle().fill(Color(.white))
            }
        }
        .frame(width: 75, height: 75, alignment: .center)
    }
}

