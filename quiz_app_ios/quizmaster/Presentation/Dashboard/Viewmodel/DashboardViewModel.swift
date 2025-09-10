import Combine
import Resolver
import SwiftUI

class DashboardViewModel: BaseViewModel<DashboardData> {
    let navigationEvents = PassthroughSubject<DashboardNavEvent, Never>()

    private var cancellables = Set<AnyCancellable>()

    private let getDashboardDataUseCase: GetDashboardDataUseCase

    init(getDashboardDataUseCase: GetDashboardDataUseCase = Resolver.resolve())
    {
        self.getDashboardDataUseCase = getDashboardDataUseCase
        super.init()
    }

    func handleIntent(_ intent: DashboardIntent) {
        switch intent {
        case .loadDashboard:
            loadDashboard()
        case .navigateToQuizSets(let item):
            navigateToDetails(item)
        }
    }

    private func loadDashboard() {
        setLoading()
        getDashboardDataUseCase.execute()
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

    private func navigateToDetails(_ item: DashboardData.Item) {
        navigationEvents.send(.navigateToQuizSets(item))
    }
}
