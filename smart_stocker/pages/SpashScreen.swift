import SwiftUI

struct SpashScreen: View {
    @State private var isActive = false
    var body: some View {
        VStack {
            if isActive {
                LoginScreen()
            } else {
                ZStack{
                    Image("splash_screen2").resizable().frame(width: .infinity, height: 180)
                    Image("splash_screen").resizable().frame(width: 300, height: 260)
                }
                Image("splash_screen3").resizable().frame(width: 300, height: 60)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                isActive = true
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    SpashScreen()
}
