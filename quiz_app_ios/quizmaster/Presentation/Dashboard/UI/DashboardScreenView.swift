import Combine
import Resolver
import SwiftUI

struct DashboardScreenView: View {
    @State private var path: [AppDestination] = []

    @StateObject var viewModel: DashboardViewModel = DashboardViewModel()
    @State private var cancellables = Set<AnyCancellable>()

    var body: some View {
        NavigationStack(path: $path) {
            PlaceholderScaffold(
                navConfig: NavigationBarConfig(
                    title: L10n.dashboardTitleString,
                ),
                uiState: viewModel.state,
                onRetryClicked: {
                    viewModel.handleIntent(.loadDashboard)
                }
            ) { dashboardData in
                ScrollView {
                    Spacer().frame(height: 16)
                    LazyVStack(spacing: 12) {
                        ForEach(dashboardData.items, id: \.sectionId) { item in
                            DashboardScreenItem(item: item) {
                                viewModel.handleIntent(
                                    .navigateToQuizSets(item)
                                )
                            }
                        }
                    }
                }
            }
            .onAppear {
                // Equivalent of `loadData()`
                viewModel.handleIntent(.loadDashboard)

                // Equivalent of Kotlin's `collect` from Flow
                viewModel.navigationEvents
                    .sink { event in
                        switch event {
                        case .navigateToQuizSets(let item):
                            let itemData = QuizSetScreenData(
                                quizTopic: item.topic,
                                quizSetTitle: item.title
                            )

                            if !path.contains(.quizSet(quizSetData: itemData)) {
                                path.append(.quizSet(quizSetData: itemData))
                            }
                            print("Navigate to quiz sets: \(item.title)")
                        }
                    }
                    .store(in: &cancellables)
            }
            .appNavigation(path: $path)
        }
        .toolbarBackground(Color.blue, for: .navigationBar)
        .tint(.white)  // ← this one makes the back chevron white
    }
}
