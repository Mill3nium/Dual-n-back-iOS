
import Foundation
import AVFoundation

class NBackVM : ObservableObject  {
    let synthesizer = AVSpeechSynthesizer()
    var theModel = NBackModel()
    @Published var markers : [VisualMarkerData] = initMarkers()
    @Published var playing = false
    
    func speech(tile:Int){
        if(tile == 1){
            let crossVoice = AVSpeechUtterance(string: "a")
            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate )
            synthesizer.speak(crossVoice)
        } else if(tile == 2){
            let crossVoice = AVSpeechUtterance(string: "b")
            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate )
            synthesizer.speak(crossVoice)
        } else if(tile == 3){
            let crossVoice = AVSpeechUtterance(string: "Time to place a marker")
            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate )
            synthesizer.speak(crossVoice)
        }
    }
}

func initMarkers() -> [VisualMarkerData] {
    return [
        VisualMarkerData(id: 0, state: 0, x: 0, y: 0),
        VisualMarkerData(id: 1, state: 0, x: 1, y: 0),
        VisualMarkerData(id: 2, state: 0, x: 2, y: 0),
        VisualMarkerData(id: 3, state: 0, x: 0, y: 1),
        VisualMarkerData(id: 4, state: 0, x: 1, y: 1),
        VisualMarkerData(id: 5, state: 0, x: 2, y: 1),
        VisualMarkerData(id: 6, state: 0, x: 0, y: 2),
        VisualMarkerData(id: 7, state: 0, x: 1, y: 2),
        VisualMarkerData(id: 8, state: 0, x: 2, y: 2)
    ]
}


struct VisualMarkerData: Hashable, Codable, Identifiable {
    var id: Int
    var state : Int
    var x: Int
    var y: Int
}
