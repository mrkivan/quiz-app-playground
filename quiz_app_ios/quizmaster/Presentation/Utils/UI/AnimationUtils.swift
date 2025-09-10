import SwiftUI

// MARK: - Horizontal Slide Transition
extension AnyTransition {
    static var horizontalSlide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),  // enter from right
            removal: .move(edge: .leading)  // exit to left
        )
    }
}

// MARK: - Lottie Exit Transition (fade + scale)
extension AnyTransition {
    static var lottieExit: AnyTransition {
        AnyTransition.scale(scale: 0.7)
            .combined(with: .opacity)
    }
}

// MARK: - Example Usage
struct AnimatedView: View {
    @State private var showSecond = false

    var body: some View {
        ZStack {
            if showSecond {
                Color.blue
                    .overlay(Text("Second View").foregroundColor(.white))
                    .transition(.horizontalSlide)
            } else {
                Color.green
                    .overlay(Text("First View").foregroundColor(.white))
                    .transition(.horizontalSlide)
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.6)) {
                showSecond.toggle()
            }
        }
    }
}
