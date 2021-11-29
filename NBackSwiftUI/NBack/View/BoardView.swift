
import SwiftUI

struct BoardView: View {
    @EnvironmentObject var vm : NBackVM
    
    var body: some View {
        ZStack{
            BackroundView(width: 300, height: 300)
            
            ForEach(vm.markers) { marker in
                VisualMarkerView(id: marker.id,markerIsTurnedOn: marker.isTuredOn )
                    .position(x: CGFloat(50+marker.x*100), y: CGFloat(50+marker.y*100))
            }
        }
        .frame(width: 300, height: 300, alignment: .center)
    }
}

