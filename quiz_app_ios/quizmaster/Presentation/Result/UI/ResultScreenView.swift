import SwiftUI
import SwiftUICore

struct ResultScreenView: View {
    let key: String
    @Binding var path: [AppDestination]

    @ObservedObject var viewModel: ResultViewModel = ResultViewModel()
    @Environment(\.presentationMode) var presentationMode

    @State private var selectedTabIndex: Int = 0

    var body: some View {
        PlaceholderScaffold(
            navConfig: NavigationBarConfig(
                title: viewModel.stateTitle,
                navAction: {
                    presentationMode.wrappedValue.dismiss()
                    // custom pop behaviour
                    if !path.isEmpty {
                        path.removeLast()
                    } else {
                        // fallback: do nothing
                    }
                },
                useLargeTitle: false
            ),
            uiState: viewModel.state,
            onRetryClicked: {
                viewModel.getResult(key: key)
            }
        ) { data in
            // `data` is guaranteed to be ResultScreenData
            VStack(spacing: 16) {
                // Summary Card
                ResultReportCard(data: data)

                // Tabs
                let tabs: [(String, [ResultData.Item])] = [
                    (
                        L10n.textCorrectItems(data.totalCorrectItems),
                        data.correctItems
                    ),
                    (
                        L10n.textSkippedItems(data.totalSkippedItems),
                        data.skippedItems
                    ),
                    (
                        L10n.textIncorrectItems(data.totalInCorrectItems),
                        data.incorrectItems
                    ),
                ].filter { !$0.1.isEmpty }  // remove empty tabs

                VStack {
                    Picker("", selection: $selectedTabIndex) {
                        ForEach(0..<tabs.count, id: \.self) { index in
                            Text(tabs[index].0).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom, 8)

                    // List of items for selected tab
                    let filteredItems = tabs[safe: selectedTabIndex]?.1 ?? []

                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(filteredItems, id: \.questionId) { item in
                                ResultItemRow(item: item)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }
            .padding(.all, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            viewModel.getResult(key: key)
        }
    }
}

// Safe array index helper
extension Array {
    subscript(safe index: Int) -> Element? {
        (indices.contains(index)) ? self[index] : nil
    }
}

// MARK: - ViewModel helper
extension ResultViewModel {
    var stateTitle: String {
        switch state {
        case .loading:
            return "Loading..."
        case .success(let data):
            return data.quizTitle ?? ""
        case .error(_):
            return "Error"
        }
    }
}
