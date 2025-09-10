import Combine
import Foundation

final class QuizRepositoryImpl: QuizRepository {
    private let api: QuizAPI
    private let cache: CacheManager

    init(api: QuizAPI, cache: CacheManager) {
        self.api = api
        self.cache = cache
    }

    func getDashboardData() -> AnyPublisher<Resource<DashboardData>, Never> {
        Future<Resource<DashboardData>, Never> { promise in  // ← 'promise' is the closure parameter
            // Check cache first
            if let cached = self.cache.getDashboard() {
                promise(.success(.success(cached.toDomain())))
                return
            }

            // Fetch from API
            self.api.getDashboard { result in
                switch result {
                case .success(let dto):
                    let data = dto.toDomain()
                    self.cache.saveDashboard(dto)  // save DTO
                    promise(.success(.success(data)))
                case .failure(let error):
                    promise(.success(.failure(error)))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    func getQuizListByTopic(topic: String) -> AnyPublisher<QuizSetData?, Never>
    {
        Future<QuizSetData?, Never> { promise in
            if let cached = self.cache.getDashboard() {
                let data = cached.items.first { $0.topic == topic }
                promise(.success(data?.toQuizSetDomain()))
            } else {
                promise(.success(nil))
            }
        }.eraseToAnyPublisher()
    }

    func getQuizzesBySetAndTopic(fileName: String) -> AnyPublisher<
        Resource<[QuizData]>, Never
    > {
        Future<Resource<[QuizData]>, Never> { promise in
            if let cached = self.cache.getQuiz(key: fileName) {
                let quizzes = cached.items.map { $0.toDomain() }
                promise(.success(.success(quizzes)))
                return
            }

            self.api.getQuizSet(fileName: fileName) { result in
                switch result {
                case .success(let dto):
                    self.cache.saveQuiz(key: fileName, quizList: dto)
                    let quizzes = dto.items.map { $0.toDomain() }
                    promise(.success(.success(quizzes)))
                case .failure(let error):
                    promise(.success(.failure(error)))
                }
            }
        }.eraseToAnyPublisher()
    }
}
