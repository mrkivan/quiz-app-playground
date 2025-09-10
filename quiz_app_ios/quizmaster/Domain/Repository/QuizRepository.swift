import Combine

protocol QuizRepository {
    func getDashboardData() -> AnyPublisher<Resource<DashboardData>, Never>
    func getQuizListByTopic(topic: String) -> AnyPublisher<QuizSetData?, Never>
    func getQuizzesBySetAndTopic(fileName: String) -> AnyPublisher<
        Resource<[QuizData]>, Never
    >
}
