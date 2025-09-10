import Combine

struct GetDashboardDataUseCase {
    private let repository: QuizRepository

    init(repository: QuizRepository) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<Resource<DashboardData>, Never> {
        return repository.getDashboardData()
    }
}
