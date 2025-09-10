import Combine
import Resolver
import SwiftUI

// MARK: - ViewModel
@MainActor
class QuizSetViewModel: BaseViewModel<QuizSetData?> {
    // One-time navigation events
    let navigationEvents = PassthroughSubject<QuizSetNavEvent, Never>()
    private var cancellables = Set<AnyCancellable>()

    private let getQuizSetListUseCase: GetQuizSetListUseCase
    private let getResultDataUseCase: GetResultDataUseCase

    init(
        getQuizSetListUseCase: GetQuizSetListUseCase = Resolver.resolve(),
        getResultDataUseCase: GetResultDataUseCase = Resolver.resolve()
    ) {
        self.getQuizSetListUseCase = getQuizSetListUseCase
        self.getResultDataUseCase = getResultDataUseCase
        super.init()
    }

    // Handle intents (like in Kotlin)
    func handleIntent(_ intent: QuizSetIntent) {
        switch intent {
        case .loadQuizSet(let topic):
            loadQuizSet(topic)
        case .navigateToQuiz(let data):
            navigateToQuiz(data)
        }
    }

    // MARK: - Private
    private func loadQuizSet(_ quizTopic: String?) {
        getQuizSetListUseCase.execute(topic: quizTopic ?? "")
            .receive(on: DispatchQueue.main)  // make sure UI updates happen on main thread
            .sink { [weak self] resource in
                switch resource {
                case .loading:
                    self?.setLoading()
                case .failure(let error):
                    self?.setError(message: error.localizedDescription)
                case .success(let data):
                    self?.setSuccess(data: data)
                }
            }
            .store(in: &cancellables)
    }

    private func navigateToQuiz(_ data: QuizSetData.SectionItem) {
        let quizScreenData = QuizScreenData(
            quizTitle: data.title,
            quizDescription: data.description,
            quizSection: data
        )
        navigationEvents.send(.navigateToQuiz(data: quizScreenData))
    }
}
