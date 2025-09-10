import Alamofire
import Foundation

protocol QuizAPI {
    func getDashboard(
        completion: @escaping (Result<DashboardDTO, AFError>) -> Void
    )
    func getQuizSet(
        fileName: String,
        completion: @escaping (Result<QuizListDTO, AFError>) -> Void
    )
}
