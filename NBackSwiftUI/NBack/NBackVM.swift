
import Foundation
import AVFoundation
import SwiftUI

class NBackVM : ObservableObject  {
    let synthesizer = AVSpeechSynthesizer()
    var theModel = NBackModel()
    
    @Published var orientation = UIDeviceOrientation.portrait
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
    
    func turnOnMarker(index:Int){
        markers[index].isTuredOn = true
    }

    func turnOffMarker(index:Int){
        markers[index].isTuredOn = false
    }

    func isTurnedOn(){
        
    }
}

func initMarkers() -> [VisualMarkerData] {
    return [
        VisualMarkerData(id: 0, isTuredOn: true, x: 0, y: 0),
        VisualMarkerData(id: 1, isTuredOn: false, x: 1, y: 0),
        VisualMarkerData(id: 2, isTuredOn: false, x: 2, y: 0),
        VisualMarkerData(id: 3, isTuredOn: false, x: 0, y: 1),
        VisualMarkerData(id: 4, isTuredOn: false, x: 1, y: 1),
        VisualMarkerData(id: 5, isTuredOn: false, x: 2, y: 1),
        VisualMarkerData(id: 6, isTuredOn: false, x: 0, y: 2),
        VisualMarkerData(id: 7, isTuredOn: false, x: 1, y: 2),
        VisualMarkerData(id: 8, isTuredOn: false, x: 2, y: 2)
    ]
}

struct VisualMarkerData: Hashable, Codable, Identifiable {
    var id: Int
    var isTuredOn:Bool
    var x: Int
    var y: Int
}
