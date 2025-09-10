// MARK: - Mock Quiz Data
let mockQuizData = QuizData(
    questionId: 1,
    question: "Which Jetpack Compose library is used for Wear OS development?",
    answerCellType: 0,
    selectedOptions: [],
    answerSectionTitle: "",
    explanation:
        "The androidx.wear.compose library provides composables and utilities specifically designed for Wear OS development.",
    answerCellList: [
        QuizData.AnswerCell(
            answerId: 1,
            questionId: 1,
            data: "A. androidx.compose",
            isItAnswer: false,
            position: 1
        ),
        QuizData.AnswerCell(
            answerId: 2,
            questionId: 1,
            data: "B. androidx.wear.compose",
            isItAnswer: true,
            position: 2
        ),
        QuizData.AnswerCell(
            answerId: 3,
            questionId: 1,
            data: "C. androidx.appcompat",
            isItAnswer: false,
            position: 3
        ),
        QuizData.AnswerCell(
            answerId: 4,
            questionId: 1,
            data: "D. androidx.constraintlayout",
            isItAnswer: false,
            position: 4
        ),
    ],
    correctAnswer: QuizData.CorrectAnswer(
        questionId: 1,
        answerId: [2],
        answer: ["B. androidx.wear.compose"],
        explanation:
            "The androidx.wear.compose library provides composables and utilities specifically designed for Wear OS development."
    ),

)
