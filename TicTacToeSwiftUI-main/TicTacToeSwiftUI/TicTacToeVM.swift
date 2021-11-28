//
//  TicTacToeVM.swift
//  TicTacToeSwiftUI
//
//  Created by Jonas Wåhslén on 2021-11-22.
//

import Foundation
import AVFoundation

class TicTacToeVM : ObservableObject  {
    let synthesizer = AVSpeechSynthesizer()
    var theModel = TicTacToeModel()
    @Published var markers : [aMarker] = initMarkers()
   
    func resetGame(){
        markers = initMarkers()
        theModel.resetGame()
    }
    
    
    func aMove(position: Int){
        print("aMove: \(position)")
        let res = theModel.aMove(position: position)
        if res != 0 {
            markers[position].state = res
            speech(tile: res)
            let count = theModel.count
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                self.hurryUP(moves: count)
            }
        }
        
    }
    
    func hurryUP(moves: Int){
        print("moves: \(moves) ModelMoves: \(theModel.count)")
        if moves == theModel.count && moves < 10 {
            speech(tile: 3)
        }
    }
    
    func getTile(position: Int) -> Int{
        return theModel.gameState[position];
    }
    
    func checkWinner() -> Int{
        return theModel.checkWinner()
    }
    
    func speech(tile:Int){
        if(tile == 1){
            let crossVoice = AVSpeechUtterance(string: "Circle")
            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate )
            synthesizer.speak(crossVoice)
           
        }else if(tile == 2){
            let crossVoice = AVSpeechUtterance(string: "Cross")
            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate )
            synthesizer.speak(crossVoice)
        }else if(tile == 3){
            let crossVoice = AVSpeechUtterance(string: "Time to place a marker")
            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate )
            synthesizer.speak(crossVoice)
        }
       
        
    }
}

func initMarkers() -> [aMarker] {
    return [
        aMarker(id: 0, state: 0, x: 0, y: 0),
        aMarker(id: 1, state: 0, x: 1, y: 0),
        aMarker(id: 2, state: 0, x: 2, y: 0),
        aMarker(id: 3, state: 0, x: 0, y: 1),
        aMarker(id: 4, state: 0, x: 1, y: 1),
        aMarker(id: 5, state: 0, x: 2, y: 1),
        aMarker(id: 6, state: 0, x: 0, y: 2),
        aMarker(id: 7, state: 0, x: 1, y: 2),
        aMarker(id: 8, state: 0, x: 2, y: 2)
    ]
}


struct aMarker: Hashable, Codable, Identifiable {
    var id: Int
    var state : Int
    var x: Int
    var y: Int
}


