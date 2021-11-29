
import SwiftUI

struct ButtonsView: View {
    @EnvironmentObject var vm : NBackVM
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                    
                }, label: {
                    Image(systemName: "ear")
                        .frame(width: 100, height: 50, alignment: .center)
                        .background(vm.playing ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                    .disabled(!vm.playing)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "eye")
                        .frame(width: 100, height: 50, alignment: .center)
                        .background(vm.playing ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                    .disabled(!vm.playing)
            }
            .padding(.top, 20)
            .padding(.bottom, 60)
            
            Button(action: {
                vm.playing = !vm.playing
            }, label: {
                Text(vm.playing ? "Stop" : "Start")
                    .frame(width: 100, height: 50, alignment: .center)
                    .background(vm.playing ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            })
            .padding(.bottom, 100)
        }
    }
}
