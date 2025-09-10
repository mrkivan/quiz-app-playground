import SwiftUI

// MARK: - Navigation Destinations
enum AppDestination: Hashable {
    case quizSet(quizSetData: QuizSetScreenData)
    case quizScreen(quizData: QuizScreenData)
    case resultScreen(key: String)
}

extension View {
    func appNavigation(path: Binding<[AppDestination]>) -> some View {
        self.navigationDestination(for: AppDestination.self) { destination in
            switch destination {
            case .quizSet(let quizSetData):
                QuizSetScreenView(quizSetData: quizSetData, path: path)
            case .quizScreen(let quizData):
                QuizScreenView(quizScreenData: quizData, quizId: -1, path: path)
            case .resultScreen(let key):
                ResultScreenView(key: key, path: path)
            }
        }
    }
}
