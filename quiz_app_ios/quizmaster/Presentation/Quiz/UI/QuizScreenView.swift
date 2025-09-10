import Combine
import SwiftUI

struct QuizScreenView: View {
    var quizScreenData: QuizScreenData?
    var quizId: Int

    @Binding var path: [AppDestination]

    @ObservedObject var viewModel: QuizViewModel = QuizViewModel()
    @State private var showExitConfirmationDialog = false
    @State private var cancellables = Set<AnyCancellable>()

    var body: some View {
        // Main content
        PlaceholderScaffold(
            navConfig: NavigationBarConfig(
                title: quizScreenData?.quizSection?.title ?? "",
                navAction: {
                    if viewModel.showExitConfirmationDialog() {
                        // show the confirmation dialog
                        showExitConfirmationDialog = true
                    } else if !path.isEmpty {
                        // just pop if no confirmation needed
                        path.removeLast()
                    }
                },
            ),
            uiState: viewModel.state,
            onRetryClicked: {
                loadData()
            }
        ) { data in
            // `data` is guaranteed to be QuizData (non-optional)
            QuizBody(
                quizData: data,
                quizState: viewModel.quizState,
                updateSelectedAnswers: { answers in
                    viewModel.handleIntent(
                        .updateSelectedAnswers(answers: answers)
                    )
                },
                submitAnswer: {
                    viewModel.handleIntent(.submitAnswer)
                },
                skipQuestion: {
                    navigateToNextQuestion()
                },
                moveToNextQuestion: {
                    navigateToNextQuestion()
                },
                navigateToResultScreen: {
                    viewModel.handleIntent(.navigateToResult)
                }
            )
        }
        .onReceive(viewModel.navigationEvents) { event in
            switch event {
            case .navigateToResult:
                // Remove QuizScreen from path
                if !path.isEmpty, case .quizScreen = path.last {
                    path.removeLast()
                }
                // Navigate to ResultScreen
                path.append(
                    .resultScreen(
                        key: quizScreenData?.quizSection?.fileName ?? ""
                    )
                )
                print("Navigate to result (skipped for now)")
            }
        }
        .alert(isPresented: $showExitConfirmationDialog) {
            Alert(
                title: Text(L10n.alertExitMessage),
                message: Text(L10n.alertExitMessage),
                primaryButton: .destructive(Text(L10n.confirmButton)) {
                    print("Exit screen")  // replace with popBackStack logic
                    if !path.isEmpty {
                        path.removeLast()
                    } else {
                        // fallback: do nothing
                    }
                },
                secondaryButton: .cancel()
            )
        }
        .onAppear {
            loadData()
        }
    }

    // MARK: - Private Functions
    private func navigateToNextQuestion() {
        // Tell the view model to move to next question
        viewModel.handleIntent(.nextQuestion)

        // Optionally log for debugging
        let nextQuizId = viewModel.getQuizId()
        print("Navigated to quiz id: \(nextQuizId)")
    }

    private func loadData() {
        if let data = quizScreenData {
            viewModel.handleIntent(.loadQuiz(data: data))
        }
    }
}

// MARK: - Preview
// 1️⃣ Add this helper somewhere in the same file (or a shared file)
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    private let content: (Binding<Value>) -> Content

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(initialValue: value)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}

// 2️⃣ Use it in your preview
struct QuizSetScreen_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper([AppDestination]()) { pathBinding in
            QuizScreenView(
                quizScreenData: QuizScreenData(
                    quizTitle: "General Knowledge Quiz",
                    quizDescription:
                        "A simple quiz to test your general knowledge.",
                    quizSection: QuizSetData.SectionItem(
                        title: "Kotlin Basics: Syntax and Variables",
                        description:
                            "Core Kotlin syntax and variable declarations",
                        position: 22,
                        fileName: "kotlin_1.json",
                        previousResult: generateMockResultData()
                    ),
                    currentQuizPosition: 1
                ),
                quizId: 1,
                path: pathBinding
            )
        }
    }
}
func generateMockResultData() -> ResultData {
    let mockItems: [ResultData.Item] = [
        ResultData.Item(
            questionId: 1,
            question: "What is the capital of France?",
            result: true,
            answerSectionTitle: "Geography",
            correctAnswer: ["Paris"],
            explanation: "Paris is the capital city of France.",
            isSkipped: false
        ),
        ResultData.Item(
            questionId: 2,
            question: "Which planet is known as the Red Planet?",
            result: false,
            answerSectionTitle: "Science",
            correctAnswer: ["Mars"],
            explanation:
                "Mars is called the Red Planet due to its reddish appearance.",
            isSkipped: false
        ),
    ]

    let totalCorrect = mockItems.filter { $0.result }.count
    let totalQuestions = mockItems.count
    let percentage =
        totalQuestions > 0 ? (totalCorrect * 100 / totalQuestions) : 0

    return ResultData(
        quizTitle: "General Knowledge Quiz",
        quizDescription: "A simple quiz to test your general knowledge.",
        resultItems: mockItems,
        totalCorrectAnswers: totalCorrect,
        totalQuestions: totalQuestions,
        resultPercentage: percentage
    )
}
