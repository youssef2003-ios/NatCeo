import SwiftUI

struct DrawerView: View {
    
    let coverImagea: [Cover] = coverData
    @State var isDrawerOpen: Bool = false
    
    @Binding var selectedCover: Int
    @Binding var scale: CGFloat
    @Binding var offset: CGSize
    

    var body: some View {
        
        HStack{
           
            Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40, alignment: .center)
                .padding(7)
                .foregroundStyle(.secondary)
                .onTapGesture {
                    isDrawerOpen.toggle()
                }
            Spacer()
            
            ForEach(coverImagea) { cover in
                Image(cover.thumbNail)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 160, alignment: .center)
                    .padding(.horizontal, -1.5)
                    .onTapGesture {
                        
                        selectedCover = cover.id - 1
                        scale = 1
                        offset = .zero
                    }
                
            } // For
            
            
        } // HStack
        .frame(width: 260, height: 105)
        .background(.thinMaterial)
        .cornerRadius(8)
        .offset(x: isDrawerOpen ? 0 : 230)
        Spacer()
        
        
    }
}

#Preview {
    DrawerView(selectedCover: .constant(0), scale: .constant(1), offset: .constant(.zero))
}
