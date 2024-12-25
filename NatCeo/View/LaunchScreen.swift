import SwiftUI

struct LaunchScreen: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
       
        ZStack{
            
            
            if isActive {
                ContentView()
            } else{
                Image("launchsceen")
                    .resizable()
                    .ignoresSafeArea(.all)
                
            }
            
        }// ZStack
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                withAnimation {
                    isActive = true
                }
            }
        }
        
        
    }
}

#Preview {
    LaunchScreen()
}
