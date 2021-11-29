
import Foundation


struct NBackModel {
    private var letterStimuli = ["a","b","a","c"]
    private var visualStimuli = [
        VisualMarkerData(id: 0, isTuredOn: true, x: 0, y: 0),
        VisualMarkerData(id: 0, isTuredOn: true, x: 1, y: 0),
        VisualMarkerData(id: 0, isTuredOn: true, x: 0, y: 2),
        VisualMarkerData(id: 0, isTuredOn: true, x: 1, y: 2),
        VisualMarkerData(id: 0, isTuredOn: true, x: 0, y: 2),
        VisualMarkerData(id: 0, isTuredOn: true, x: 2, y: 1),
        VisualMarkerData(id: 0, isTuredOn: true, x: 0, y: 2)
    ]
    private var score = Score(nrOfVisualMacthes: 0, nrOfStimuliMatches: 0)
    
    mutating func resetGame(){
        score = Score(nrOfVisualMacthes: 0, nrOfStimuliMatches: 0)
    }
}

struct Score{
    var nrOfVisualMacthes:Int
    var nrOfStimuliMatches:Int
}
