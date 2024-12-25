import SwiftUI

struct ContentView: View {
    
    @State var imageScale: CGFloat = 1
    @State var imageOffset: CGSize = .zero
    
    let covers: [Cover] = coverData
    @State var coverIndex: Int = 0
    
    var body: some View {
        
        
        Image(covers[coverIndex].coverName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .padding()
            .scaleEffect(imageScale)
            .offset(imageOffset)
            .shadow(radius: 8, x: 4, y: 10)
        
        
        // 1. Double Tap Gesture
        
            .onTapGesture(count: 2) {
                
                withAnimation(.spring()) {
                    if imageScale == 1 {
                        imageScale = 5
                    } else{
                        imageScale = 1
                        imageOffset = .zero
                    }
                }
                
            }
        
        // 2. Drag Gesture
        
            .gesture(DragGesture()
                     
                .onChanged({ gesture in
                    
                    imageOffset = gesture.translation
                })
                     
                    .onEnded({ gesture in
                        withAnimation(.spring()) {
                            if imageScale <= 1 {
                                imageOffset = .zero
                                imageScale = 1
                            }
                        }
                        
                    })
            )
        
        //3. Magification gesture
        
            .gesture(MagnificationGesture()
                     
                .onChanged({ scale in
                    withAnimation(.spring()) {
                        if imageScale >= 1 && imageScale <= 5 {
                            imageScale = scale
                        } else if imageScale > 5 {
                            imageScale = 5
                        } else if imageScale < 1 {
                            imageScale = 1
                        }
                    }
                    
                })
                     
                    .onEnded({ scale in
                        withAnimation(.spring()) {
                            if imageScale > 5 {
                                imageScale = 5
                            } else if imageScale < 1 {
                                imageScale = 1
                            }
                        }
                        
                    })
            )
        
        
        // Drawer
            .overlay(alignment: .topTrailing) {
                DrawerView(selectedCover: $coverIndex, scale: $imageScale, offset: $imageOffset)
                    .padding(.top, 15)
            }
        
        // Control View
            .overlay(alignment: .bottom) {
                ControlView(scale: $imageScale, offset: $imageOffset)
            }
        
        // PannelView
            .overlay(alignment: .top) {
                PannelView(scale: imageScale, offset: imageOffset)
                    .padding()
                    .offset(y: -50)
            }
        
        
        
    }
}


#Preview {
    ContentView()
}
