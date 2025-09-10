import Combine
import Foundation

struct GetQuizSetListUseCase {
    private let repository: QuizRepository

    init(repository: QuizRepository) {
        self.repository = repository
    }

    func execute(topic: String) -> AnyPublisher<Resource<QuizSetData>, Never> {
        return repository.getQuizListByTopic(topic: topic)
            .map { quizSetData in
                if let data = quizSetData {
                    return Resource.success(data)
                } else {
                    return Resource.failure(
                        NSError(
                            domain: "",
                            code: -1,
                            userInfo: [
                                NSLocalizedDescriptionKey: "No quiz data found"
                            ]
                        )
                    )
                }
            }
            .prepend(.loading)  // emits loading first
            .eraseToAnyPublisher()
    }
}
