import Combine

struct GetQuizDataBySetAndTopicUseCase {
    private let repository: QuizRepository

    init(repository: QuizRepository) {
        self.repository = repository
    }

    func execute(fileName: String) -> AnyPublisher<Resource<[QuizData]>, Never>
    {
        return repository.getQuizzesBySetAndTopic(fileName: fileName)
    }
}
