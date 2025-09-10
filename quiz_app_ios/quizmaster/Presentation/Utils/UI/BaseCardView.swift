import SwiftUI

struct BaseCardView<Content: View>: View {
    let onClick: () -> Void
    let bodyContent: () -> Content

    var body: some View {
        VStack {
            bodyContent()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(
            RoundedRectangle(
                cornerRadius: AppCardDefaults.shape,
                style: .continuous
            )
            .fill(AppCardDefaults.colors)
            .shadow(
                color: .black.opacity(0.2),
                radius: AppCardDefaults.elevation,
                x: 0,
                y: 2
            )
        )
        .contentShape(Rectangle())  // makes entire area tappable
        .onTapGesture {
            onClick()
        }
    }
}
