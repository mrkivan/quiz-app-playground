import Combine

class BaseViewModel<T>: ObservableObject {
    @Published var state: QuizAppUIState<T> = .loading

    func setLoading() {
        state = .loading
    }

    func setSuccess(data: T) {
        state = .success(data)
    }

    func setError(message: String) {
        state = .error(message)
    }

    static var ERROR_DATA_NOT_FOUND: String { "Data not found" }
}
