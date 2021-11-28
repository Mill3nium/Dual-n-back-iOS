//
//  TicTacToeModel.swift
//  TicTacToeSwiftUI
//
//  Created by Jonas Wåhslén on 2021-11-18.
//

import Foundation

import Foundation

struct TicTacToeModel {
    var currentPlayer = 1 // cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameIsActive = true
    var count = 1
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    mutating func resetGame(){
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        currentPlayer = 1
        count = 1;
    }
    
    mutating func aMove(position: Int) -> Int{
        if gameState[position] == 0 && gameIsActive == true{
            gameState[position] = currentPlayer
            count = count + 1;
            if(currentPlayer == 1){
                currentPlayer = 2
                return 1
            }else{
                currentPlayer = 1
                return 2
            }
            
        }
        return 0
    }
    
    func getTile(position: Int) -> Int{
        return gameState[position];
    }
    
    mutating func checkWinner() -> Int{
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                gameIsActive = false
                
                if gameState[combination[0]] == 1{
                    return 1
                }else{
                    return 2
                }
            }
        }
        
        if gameIsActive == true && count > 9{
            gameIsActive = false
            return 3
        }
        return 0
    }
}
