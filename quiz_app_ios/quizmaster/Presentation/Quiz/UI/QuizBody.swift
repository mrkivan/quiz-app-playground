import SwiftUI

struct QuizBody: View {
    var quizData: QuizData
    var quizState: QuizState
    var updateSelectedAnswers: ([Int]) -> Void
    var submitAnswer: () -> Void
    var skipQuestion: () -> Void
    var moveToNextQuestion: () -> Void
    var navigateToResultScreen: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            // Question + Progress
            HStack {
                Text(quizData.question)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, 8)

                QuizProgressWithShape(
                    currentQuestion: quizState.currentQuestionNumber,
                    totalQuestions: quizState.totalQuestions
                )
            }
            .padding(.bottom, 16)

            // Question & Answer Options
            VStack {
                Spacer().frame(height: 16)

                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(quizData.answerCellList, id: \.answerId) {
                            answer in
                            let isCorrect = quizData.correctAnswer.answerId
                                .contains(answer.answerId)
                            let isSelected = quizState.selectedAnswers.contains(
                                answer.answerId
                            )

                            let backgroundColor: Color = {
                                if !quizState.isSubmitted {
                                    return .clear
                                } else if isSelected && isCorrect {
                                    return Color.green.opacity(0.2)
                                } else if isSelected && !isCorrect {
                                    return Color.red.opacity(0.2)
                                } else {
                                    return .clear
                                }
                            }()

                            Button(action: {
                                guard !quizState.isSubmitted else { return }
                                if quizData.answerCellType == 0 {
                                    // Single choice
                                    updateSelectedAnswers([answer.answerId])
                                } else {
                                    // Multiple choice
                                    if isSelected {
                                        updateSelectedAnswers(
                                            quizState.selectedAnswers.filter {
                                                $0 != answer.answerId
                                            }
                                        )
                                    } else {
                                        updateSelectedAnswers(
                                            quizState.selectedAnswers + [
                                                answer.answerId
                                            ]
                                        )
                                    }
                                }
                            }) {
                                HStack {
                                    if quizData.answerCellType == 0 {
                                        Image(
                                            systemName: isSelected
                                                ? "largecircle.fill.circle"
                                                : "circle"
                                        )
                                        .tint(Color.blue)
                                    } else {
                                        Image(
                                            systemName: isSelected
                                                ? "checkmark.square.fill"
                                                : "square"
                                        )
                                        .tint(Color.blue)
                                    }

                                    Text(answer.data)
                                        .font(.body)
                                        .padding(.leading, 8)
                                        .tint(Color.blue)

                                    Spacer()
                                }
                                .padding(8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(backgroundColor)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(
                                                    isSelected
                                                        ? Color.blue
                                                        : Color.gray,
                                                    lineWidth: 2
                                                )
                                        )
                                        .padding(1)  // optional, ensures stroke is fully visible
                                )
                            }
                        }
                    }
                }

                // Explanation
                if quizState.showExplanation {
                    Spacer().frame(height: 16)
                    VStack(alignment: .leading) {
                        Text(quizData.explanation)
                            .font(.subheadline)
                            .padding(16)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Buttons
            QuizButtons(
                quizState: quizState,
                submitAnswer: submitAnswer,
                skipQuestion: skipQuestion,
                moveToNextQuestion: moveToNextQuestion,
                navigateToResultScreen: navigateToResultScreen
            )
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Preview
#Preview {
    QuizBody(
        quizData: mockQuizData,
        quizState: QuizState(
            selectedAnswers: [],
            isSubmitted: false,
            showExplanation: false,
            isLastItem: false,
            currentQuestionNumber: 20,
            totalQuestions: 30
        ),
        updateSelectedAnswers: { _ in },
        submitAnswer: {},
        skipQuestion: {},
        moveToNextQuestion: {},
        navigateToResultScreen: {}
    )
}
