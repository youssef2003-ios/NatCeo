import SwiftUI

struct PannelView: View {
    
    @State var isPannelyDisplayed : Bool = false
    
     var scale: CGFloat
     var offset: CGSize
    
    var body: some View {
        
        HStack{
            
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30, alignment: .center)
                .onLongPressGesture(minimumDuration: 1) {
                    isPannelyDisplayed.toggle()
                }
            
            Spacer()
            
            HStack{
                
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                    .padding(.vertical, 4)
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                    .padding(.vertical, 4)
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                    .padding(.vertical, 4)
                Spacer()
                
            } //HStack
            .background(.ultraThinMaterial)
            .font(.footnote)
            .frame(maxWidth: 420, minHeight: 30, alignment: .center)
            .opacity(isPannelyDisplayed ? 1 : 0)
            
            
        } // HStack
        
        
    }
}

#Preview {
    PannelView(scale: 1, offset: .zero)
}
