
import SwiftUI

struct ButtonsView:View{
    var body: some View{
        HStack{
            Section{
                Button(action: {
                    
                }, label: {
                    Image(systemName: "ear")
                        .frame(width: 100, height: 50, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "eye")
                        .frame(width: 100, height: 50, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
            }.padding(.top,100)

        }
    }
}
