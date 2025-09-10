import SwiftUI

// MARK: - PlaceholderScaffold
struct PlaceholderScaffold<Content: View, T>: View {
    let navConfig: NavigationBarConfig
    let uiState: QuizAppUIState<T>
    let onRetryClicked: () -> Void
    let content: (T) -> Content  // only pass the success data

    var body: some View {
        VStack(spacing: 0) {
            buildContent()
        }
        .appNavigationBar(navConfig)  // <-- use the native nav bar
    }
    @ViewBuilder
    func buildContent() -> some View {
        switch uiState {
        case .loading:
            LoadingView()
        case .success(let data):
            content(data)
        case .error(let errorMessage):
            ErrorView(
                errorMessage: errorMessage,
                onRetryClicked: onRetryClicked
            )
        }
    }
}

// MARK: - Loading View
struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()  // optional background

            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(3.5)  // makes it bigger
                .tint(.blue)  // highlight color (iOS 15+)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Error View
struct ErrorView: View {
    let errorMessage: String
    let onRetryClicked: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text(errorMessage)
                .multilineTextAlignment(.center)
                .padding()

            Button(action: onRetryClicked) {
                HStack {
                    Text(L10n.retryButton)
                    Image(systemName: "arrow.clockwise")
                        .font(.system(size: 18))
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear)
    }
}

// MARK: - Preview
struct PlaceholderScaffold_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {  // 🔑 wrap in NavigationStack
                PlaceholderScaffold(
                    navConfig: NavigationBarConfig(
                        title: "Dashboard",
                    ),
                    uiState: QuizAppUIState<String>.error("Network Error"),
                    onRetryClicked: { print("Retry tapped") }
                ) { data in
                    Text("Success with data: \(data)")
                        .padding()
                }
                .appNavigationBar(
                    PlaceholderScaffold_Previews.defaultNavConfig()
                )
            }
            .previewDisplayName("Error")

            NavigationStack {
                PlaceholderScaffold(
                    navConfig: NavigationBarConfig(
                        title: "Dashboard",
                    ),
                    uiState: QuizAppUIState<String>.success("Quiz App"),
                    onRetryClicked: {}
                ) { data in
                    VStack(spacing: 0) {
                        HStack {
                            Text("Success with data: \(data)")
                                .padding()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .appNavigationBar(
                    PlaceholderScaffold_Previews.defaultNavConfig()
                )
            }
            .previewDisplayName("Success")

            NavigationStack {
                PlaceholderScaffold(
                    navConfig: NavigationBarConfig(
                        title: "Dashboard",
                    ),
                    uiState: QuizAppUIState<String>.loading,
                    onRetryClicked: {}
                ) { data in
                    Text("Loading...")
                        .padding()
                }
                .appNavigationBar(
                    PlaceholderScaffold_Previews.defaultNavConfig()
                )
            }
            .previewDisplayName("Loading")
        }
    }

    // Optional helper to create default nav config
    static func defaultNavConfig() -> NavigationBarConfig {
        NavigationBarConfig(title: "Dashboard")
    }
}
