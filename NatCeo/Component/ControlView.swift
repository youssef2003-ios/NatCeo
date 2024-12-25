import SwiftUI

struct ControlView: View {
    
    @Binding var scale: CGFloat
    @Binding var offset: CGSize
    
    var body: some View {
        
        HStack{
            
            Button {
                //Action to minize the pic
                withAnimation(.spring()) {
                    if scale > 1 {
                        scale = scale - 1
                    }
                }
                
            } label: {
                Image(systemName: "minus.magnifyingglass")
            }
            
            
            Button {
                //Action to Reset image
                withAnimation(.spring()) {
                    scale = 1
                    offset = .zero
                }
                
            } label: {
                Image(systemName: "arrow.up.left.and.down.right.magnifyingglass")
            }
            
            Button {
                //Action to plus the pic
                withAnimation(.spring()) {
                    if scale < 5 {
                        scale = scale + 1
                    }
                }
                
            } label: {
                Image(systemName: "plus.magnifyingglass")
            }
            
        } // HStack
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .foregroundStyle(.white)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .font(.largeTitle)
        
        
    }
}

#Preview {
    ControlView(scale: .constant(1), offset: .constant(.zero))
}
