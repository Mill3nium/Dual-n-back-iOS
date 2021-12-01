
import SwiftUI

struct ButtonsView: View {
    @EnvironmentObject var vm : NBackVM
    
    var body: some View {
        VStack {
            
            Button(action: {
                if vm.playing { vm.reset() }
                else { vm.begin() }
            }, label: {
                Text(vm.playing ? "Stop" : "Start")
                    .frame(width: 100, height: 50, alignment: .center)
                    .background(vm.playing ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            })
                .padding(.bottom, 40)
            
            HStack{
                
                if vm.preferences.audio && vm.preferences.visual {
                    Spacer()
                }
                
                if vm.preferences.audio {
                    Button(action: {
                        vm.ear()
                    }, label: {
                        Image(systemName: "ear")
                            .frame(width: 100, height: 70, alignment: .center)
                            .background(vm.audioButtonState.color)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }).disabled(vm.audioButtonState == NBackVM.ButtonState.disabled)
                }
                
                if vm.preferences.audio && vm.preferences.visual {
                    Spacer()
                }
                
                if vm.preferences.visual {
                    Button(action: {
                        vm.eye()
                    }, label: {
                        Image(systemName: "eye")
                            .frame(width: 100, height: 70, alignment: .center)
                            .background(vm.visualButtonState.color)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }).disabled(vm.visualButtonState == NBackVM.ButtonState.disabled)
                }
                
                if vm.preferences.audio && vm.preferences.visual {
                    Spacer()
                }
            }
                .padding(.bottom, 50)
            
            Text(vm.playing
                 ? "Stimuli \(vm.currentStimuli) of \(vm.preferences.stimulations)"
                 : "\(vm.preferences.n)-Back, \(vm.preferences.stimulations) stimulations"
            )
        }
    }
}
