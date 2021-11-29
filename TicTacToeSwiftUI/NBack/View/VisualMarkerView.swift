
import SwiftUI

struct VisualMarkerView: View {
    @EnvironmentObject var theViewModel : NBackVM

    var marker : Int
    var id : Int
    
    var onPosition: Bool = false
    
    var body: some View {
        if onPosition == true {
            Rectangle().fill(Color(.white))
                .frame(width: 95, height: 95, alignment: .center)
        } else {
            Rectangle().fill(Color(.orange))
                .frame(width: 95, height: 95, alignment: .center)
        }
    }
}
