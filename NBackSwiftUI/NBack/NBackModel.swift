
import Foundation


struct NBackModel {
    private var letterStimuli = ["a","b","a","c"]
    private var score = Score(nrOfVisualMacthes: 0, nrOfStimuliMatches: 0)
    
    mutating func resetGame(){
        score = Score(nrOfVisualMacthes: 0, nrOfStimuliMatches: 0)
    }
}

struct Score{
    var nrOfVisualMacthes:Int
    var nrOfStimuliMatches:Int
}
