import SwiftUI

struct QuizButtons: View {
    var quizState: QuizState
    var submitAnswer: () -> Void
    var skipQuestion: () -> Void
    var moveToNextQuestion: () -> Void
    var navigateToResultScreen: () -> Void

    @State private var showSkipDialog = false
    @State private var showSubmitConfirmationDialog = false

    var body: some View {
        VStack {
            HStack(spacing: 16) {
                // Skip Button
                Button(action: {
                    showSkipDialog = true
                }) {
                    Text(L10n.skipButton)
                        .frame(maxWidth: .infinity)
                }
                .disabled(
                    quizState.isSubmitted || !quizState.selectedAnswers.isEmpty
                        || quizState.isLastItem
                )
                .buttonStyle(.borderedProminent)
                .tint(.blue)

                // Submit Button
                Button(action: {
                    showSubmitConfirmationDialog = true
                }) {
                    Text(L10n.submitButton)
                        .frame(maxWidth: .infinity)
                }
                .disabled(
                    quizState.selectedAnswers.isEmpty || quizState.isSubmitted
                )
                .buttonStyle(.borderedProminent)
                .tint(.blue)

                // Next / Result Button
                Button(action: {
                    if quizState.isLastItem {
                        navigateToResultScreen()
                    } else {
                        moveToNextQuestion()
                    }
                }) {
                    Text(
                        quizState.isLastItem
                            ? L10n.resultButton : L10n.nextButton
                    )
                    .frame(maxWidth: .infinity)
                }
                .disabled(!(quizState.isSubmitted || quizState.isLastItem))
                .buttonStyle(.borderedProminent)
                .tint(.blue)
            }
            .padding(.top, 16)
        }
        // Submit Confirmation Alert
        .alert(
            L10n.alertSubmitAnswerTitle,
            isPresented: $showSubmitConfirmationDialog
        ) {
            Button(L10n.confirmButton, role: .destructive) {
                submitAnswer()
            }
            Button(L10n.cancelButton, role: .cancel) {}
        } message: {
            Text(L10n.alertSubmitAnswerMessage)
        }
        .tint(.blue)

        // Skip Confirmation Alert
        .alert(
            L10n.alertSkipQuestionTitle,
            isPresented: $showSkipDialog
        ) {
            Button(L10n.skipButton, role: .destructive) {
                skipQuestion()
            }
            Button(L10n.cancelButton, role: .cancel) {}
        } message: {
            Text(L10n.alertSkipQuestionMessage)
        }
        .tint(.blue)
    }
}

// MARK: - Preview
#Preview {
    QuizButtons(
        quizState: QuizState(
            selectedAnswers: [],
            isSubmitted: false,
            showExplanation: false,
            isLastItem: false,
            currentQuestionNumber: 20,
            totalQuestions: 30
        ),
        submitAnswer: {},
        skipQuestion: {},
        moveToNextQuestion: {},
        navigateToResultScreen: {}
    )
}
