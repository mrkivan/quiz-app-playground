import Combine
import Foundation
import Resolver

class QuizViewModel: BaseViewModel<QuizData> {
    // MARK: - State
    @Published private(set) var quizState = QuizState()
    @Published private(set) var quizResultState: Bool? = nil

    private var cacheQuizList: [QuizData] = []
    private var resultItems: [ResultData.Item] = []
    private var currentQuizPosition: Int = 0
    private var cacheScreenData: QuizScreenData? = nil

    // MARK: - Dependencies
    private let getQuizDataUseCase: GetQuizDataBySetAndTopicUseCase
    private let saveResultDataUseCase: SaveResultDataUseCase

    // MARK: - Navigation Events
    let navigationEvents = PassthroughSubject<QuizNavEvent, Never>()

    private var cancellables = Set<AnyCancellable>()

    // MARK: - Init
    init(
        getQuizDataUseCase: GetQuizDataBySetAndTopicUseCase =
            Resolver.resolve(),
        saveResultDataUseCase: SaveResultDataUseCase = Resolver.resolve()
    ) {
        self.getQuizDataUseCase = getQuizDataUseCase
        self.saveResultDataUseCase = saveResultDataUseCase
        super.init()
    }

    // MARK: - Intent Handler
    func handleIntent(_ intent: QuizIntent) {
        switch intent {
        case .loadQuiz(let data):
            fetchQuiz(quizScreenData: data)
        case .navigateToResult:
            navigateToResultScreen()
        case .skipQuestion:
            moveToNextQuestion(isSkipped: true)
        case .nextQuestion:
            moveToNextQuestion()
        case .submitAnswer:
            submitAnswer()
        case .updateSelectedAnswers(let answers):
            updateSelectedAnswers(answers)
        }
    }

    // MARK: - Private Functions

    private func fetchQuiz(quizScreenData: QuizScreenData) {
        cacheScreenData = quizScreenData

        setLoading()
        getQuizDataUseCase.execute(
            fileName: quizScreenData.quizSection?.fileName ?? ""
        )
        .sink { [weak self] resource in
            switch resource {
            case .loading:
                self?.setLoading()
            case .failure(let error):
                self?.setError(message: error.localizedDescription)
            case .success(let quizItems):
                guard !quizItems.isEmpty else {
                    self?.setError(
                        message: BaseViewModel<QuizData>.ERROR_DATA_NOT_FOUND
                    )
                    return
                }
                self?.currentQuizPosition = 0
                self?.cacheQuizList = quizItems.shuffled()

                if let first = self?.cacheQuizList.first {
                    self?.setSuccess(data: first)
                    self?.quizState = QuizState(
                        isLastItem: self?.isLastItem() ?? false,
                        currentQuestionNumber: 1,
                        totalQuestions: quizItems.count
                    )
                }
            }
        }
        .store(in: &cancellables)
    }

    private func updateSelectedAnswers(_ answers: [Int]) {
        quizState.selectedAnswers = answers
    }

    private func submitAnswer() {
        let currentQuiz = cacheQuizList[currentQuizPosition]
        let isCorrect =
            Set(currentQuiz.correctAnswer.answerId)
            == Set(quizState.selectedAnswers)

        quizState.isSubmitted = true
        quizState.showExplanation = true
        quizResultState = isCorrect
    }

    func showExitConfirmationDialog() -> Bool {
        return getQuizId() > 1 || !quizState.selectedAnswers.isEmpty
    }

    func getQuizId() -> Int {
        return currentQuizPosition + 1
    }

    private func moveToNextQuestion(isSkipped: Bool = false) {
        quizResultState = nil
        saveResult(isSkipped: isSkipped)

        let nextIndex = currentQuizPosition + 1
        if nextIndex < cacheQuizList.count {
            currentQuizPosition = nextIndex
            let nextQuiz = cacheQuizList[currentQuizPosition]

            setSuccess(data: nextQuiz)
            quizState = QuizState(
                isLastItem: isLastItem(),
                currentQuestionNumber: currentQuizPosition + 1,
                totalQuestions: cacheQuizList.count
            )
        } else {
            navigateToResultScreen()
        }
    }

    private func navigateToResultScreen() {
        saveResult()

        guard let data = cacheScreenData else { return }

        let correctAnswers = getCorrectResultsCount()
        let resultData = ResultData(
            quizTitle: data.quizTitle,
            quizDescription: data.quizDescription,
            resultItems: resultItems,
            totalCorrectAnswers: correctAnswers,
            totalQuestions: cacheQuizList.count,
            resultPercentage: getResultPercentage(
                correctAnswers: correctAnswers
            )
        )

        saveResultDataUseCase.execute(
            key: data.quizSection?.fileName ?? "",
            result: resultData
        )
        .sink { [weak self] _ in
            self?.navigationEvents.send(
                .navigateToResult(key: self?.getResultKey() ?? "")
            )
        }
        .store(in: &cancellables)
    }

    private func getCorrectResultsCount() -> Int {
        return resultItems.filter { $0.result }.count
    }

    private func getResultPercentage(correctAnswers: Int) -> Int {
        let totalQuestions = cacheQuizList.count
        return totalQuestions > 0
            ? Int((Double(correctAnswers) / Double(totalQuestions)) * 100) : 0
    }

    private func isLastItem() -> Bool {
        return currentQuizPosition + 1 == cacheQuizList.count
    }

    private func getResultKey() -> String {
        return cacheScreenData?.quizSection?.fileName ?? ""
    }

    private func saveResult(isSkipped: Bool = false) {
        let currentQuiz = cacheQuizList[currentQuizPosition]
        let resultItem = ResultData.Item(
            questionId: currentQuiz.questionId,
            question: currentQuiz.question,
            result: Set(currentQuiz.correctAnswer.answerId)
                == Set(quizState.selectedAnswers),
            answerSectionTitle: currentQuiz.answerSectionTitle,  // ✅ fix here
            correctAnswer: currentQuiz.correctAnswer.answer,
            explanation: currentQuiz.explanation,
            isSkipped: isSkipped
        )
        resultItems.append(resultItem)
    }
}
