
import SwiftUI

struct VisualMarkerView: View {
    @EnvironmentObject var theViewModel : NBackVM

    var id : Int
    var markerIsTurnedOn: Bool
    
    var body: some View {
        if markerIsTurnedOn == true {
            Rectangle().fill(Color(.blue))
                .frame(width: 95, height: 95, alignment: .center)
                .animation(.linear, value: 2)
        } else {
            Rectangle().fill(Color(.orange))
                .frame(width: 95, height: 95, alignment: .center)
                .animation(.linear, value: 2)
        }
    }
}
