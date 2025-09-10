import Foundation

enum QuizAppUIState<T> {
    case loading
    case success(T)
    case error(String)
}
