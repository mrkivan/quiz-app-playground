import Combine
import Resolver

class ResultViewModel: BaseViewModel<ResultScreenData> {
    private let getResultDataUseCase: GetResultDataUseCase
    private var cancellables = Set<AnyCancellable>()

    init(getResultDataUseCase: GetResultDataUseCase = Resolver.resolve()) {
        self.getResultDataUseCase = getResultDataUseCase
        super.init()
    }

    func getResult(key: String) {
        setLoading()

        getResultDataUseCase.execute(key: key)
            .sink { [weak self] result in
                guard let self = self else { return }

                if let result = result {
                    // Could be optimized with single pass for large items
                    let correctItems = result.resultItems.filter { $0.result }
                    let skippedItems = result.resultItems.filter {
                        $0.isSkipped
                    }
                    let incorrectItems = result.resultItems.filter {
                        !$0.result && !$0.isSkipped
                    }

                    let screenData = ResultScreenData(
                        quizTitle: result.quizTitle,
                        quizDescription: result.quizDescription,
                        correctItems: correctItems,
                        skippedItems: skippedItems,
                        incorrectItems: incorrectItems,
                        totalCorrectItems: correctItems.count,
                        totalSkippedItems: skippedItems.count,
                        totalInCorrectItems: incorrectItems.count,
                        totalQuestions: result.resultItems.count,
                        resultPercentage: result.resultPercentage
                    )
                    self.setSuccess(data: screenData)
                } else {
                    self.setError(message: Self.ERROR_DATA_NOT_FOUND)
                }
            }
            .store(in: &cancellables)
    }
}
