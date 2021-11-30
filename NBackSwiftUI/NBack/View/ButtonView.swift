
import SwiftUI

struct ButtonsView: View {
    @EnvironmentObject var vm : NBackVM
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                    vm.ear()
                }, label: {
                    Image(systemName: "ear")
                        .frame(width: 100, height: 50, alignment: .center)
                        .background(vm.audioButtonState.color)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                    .disabled(vm.audioButtonState == NBackVM.ButtonState.disabled)
                
                Button(action: {
                    vm.eye()
                }, label: {
                    Image(systemName: "eye")
                        .frame(width: 100, height: 50, alignment: .center)
                        .background(vm.visualButtonState.color)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                    .disabled(vm.visualButtonState == NBackVM.ButtonState.disabled)
            }
            .padding(.top, 20)
            .padding(.bottom, 60)
            
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
            .padding(.bottom, 70)
            
            Text(vm.playing
                 ? "Stimuli \(vm.currentStimuli) of \(vm.maxStimuli)"
                 : "\(vm.n)-Back, \(vm.maxStimuli) stimulations"
            )
        }
    }
}
