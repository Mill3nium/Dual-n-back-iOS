
import Foundation
import AVFoundation
import SwiftUI

class NBackVM : ObservableObject  {
    let synthesizer = AVSpeechSynthesizer()
    
    @Published var preferences = PreferencesModel.load()
    @Published var orientation = UIDeviceOrientation.portrait
    @Published var visuals : [VisualMarkerData] = initMarkers()
    @Published var playing = false
    
    enum ButtonState {
        case disabled, enabled, incorrect
        var color: Color {
            get {
                switch self {
                case .disabled: return Color.gray
                case .enabled: return Color.blue
                case .incorrect: return Color.red
                }
            }
        }
    }
    @Published var visualButtonState = ButtonState.disabled
    @Published var audioButtonState = ButtonState.disabled
    
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
    
    func reset() {
        stimuliTask?.cancel()
        playing = false
        currentStimuli = 0
        
        visuals = initMarkers()
        visualButtonState = ButtonState.disabled
        audioButtonState = ButtonState.disabled
    }
    
    var stimuliTask: Task<(), Never>?
    func begin() {
        playing = true
        visualSequence = Array.init(repeating: -1, count: preferences.n+1)
        audioSequence = Array.init(repeating: -1, count: preferences.n+1)
        stimuliTask = Task { await nextStimuli() }
    }
    
//    @Published var n = 1;
    @Published var currentStimuli = 0
//    @Published var maxStimuli = 21
//    @Published var stimuliInterval: UInt64 = 3
    
    private var visualSequence: [Int] = []
    private var visualMatch = false
    private var visualNoticed = false
    
    private var audioSequence: [Int] = []
    private var audioMatch = false
    private var audioNoticed = false
    
    func nextStimuli() async {
        do {
            try await Task.sleep(nanoseconds: preferences.interval * 1_000_000_000)
            
            // notify if incorrect
            if currentStimuli != 0 {
                DispatchQueue.main.async {
                    if (self.visualMatch && !self.visualNoticed) || (!self.visualMatch && self.visualNoticed) {
                        self.visualButtonState = ButtonState.incorrect
                    }
                    if (self.audioMatch && !self.audioNoticed) || (!self.audioMatch && self.audioNoticed) {
                        self.audioButtonState = ButtonState.incorrect
                    }
                }
                
                try await Task.sleep(nanoseconds: 200_000_000)
                DispatchQueue.main.async {
                    self.visualButtonState = ButtonState.disabled
                    self.audioButtonState = ButtonState.disabled
                }
                try await Task.sleep(nanoseconds: 300_000_000)
            }
            
            if(self.currentStimuli == self.preferences.stimulations) {
                await end()
                return
            }
            
            visualNoticed = false
            audioNoticed = false
            let nextVisual = Int.random(in: 0...8)
            let nextAudio = Int.random(in: 0...8)
            
            // Process visual n-back
            // Rotate back 1 step in sequence
            for m in 1...preferences.n { visualSequence[m-1] = visualSequence[m] }
            // Push next to end of sequence
            visualSequence[preferences.n] = nextVisual;
            // Check if first marker is same as last marker, set flag if current is an N-Back
            visualMatch = visualSequence[0] != -1 && visualSequence[0] == visualSequence[preferences.n]
            // Trigger visual stimuli
            DispatchQueue.main.async {
                if self.currentStimuli >= 1 {
                    self.visualButtonState = ButtonState.enabled
                    self.audioButtonState = ButtonState.enabled
                }
                
                self.visuals[nextVisual].triggered = true;
                
                self.currentStimuli += 1
            }
            
            // Process audio n-back
            // Rotate back 1 step in sequence
            for m in 1...preferences.n { audioSequence[m-1] = audioSequence[m] }
            // Push next to end of sequence
            audioSequence[preferences.n] = nextAudio;
            // Check if first marker is same as last marker, set flag if current is an N-Back
            audioMatch = audioSequence[0] != -1 && audioSequence[0] == audioSequence[preferences.n]
            // Trigger audio stimuli
            
            try await Task.sleep(nanoseconds: 600_000_000)
            
            // Untrigger visual stimuli
            DispatchQueue.main.async {
                self.visuals[nextVisual].triggered = false;
            }
            
            await nextStimuli()
        } catch {
            DispatchQueue.main.async {
                self.reset()
            }
        }
    }
    
    func eye() {
        visualButtonState = ButtonState.disabled
        visualNoticed = true
    }
    
    func ear() {
        audioButtonState = ButtonState.disabled
        audioNoticed = true
    }
    
    func end() async {
        // Calculate result
        // Save
        DispatchQueue.main.async { self.reset() }
    }
}

func initMarkers() -> [VisualMarkerData] {
    return [
        VisualMarkerData(id: 0, x: 0, y: 0),
        VisualMarkerData(id: 1, x: 1, y: 0),
        VisualMarkerData(id: 2, x: 2, y: 0),
        VisualMarkerData(id: 3, x: 0, y: 1),
        VisualMarkerData(id: 4, x: 1, y: 1),
        VisualMarkerData(id: 5, x: 2, y: 1),
        VisualMarkerData(id: 6, x: 0, y: 2),
        VisualMarkerData(id: 7, x: 1, y: 2),
        VisualMarkerData(id: 8, x: 2, y: 2)
    ]
}

struct VisualMarkerData: Hashable, Codable, Identifiable {
    var id: Int
    var x: Int
    var y: Int
    var triggered = false
}
