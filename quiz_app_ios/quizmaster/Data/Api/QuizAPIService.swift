import Alamofire
import Foundation
import Resolver

final class QuizAPIService: QuizAPI {

    private let baseURL: String
    private let session: Session

    init(
        baseURL: String = Constants.baseURL,
        session: Session = Resolver.resolve()
    ) {
        self.baseURL = baseURL
        self.session = session  // use injected session or global AF
    }

    func getDashboard(
        completion: @escaping (Result<DashboardDTO, AFError>) -> Void
    ) {
        let url = "\(baseURL)quiz_sets.json"

        session.request(url)
            .validate()
            .responseDecodable(of: DashboardDTO.self) { response in
                completion(response.result)
            }
    }

    func getQuizSet(
        fileName: String,
        completion: @escaping (Result<QuizListDTO, AFError>) -> Void
    ) {
        let url = "\(baseURL)\(fileName)"

        session.request(url)
            .validate()
            .responseDecodable(of: QuizListDTO.self) { response in
                completion(response.result)
            }
    }
}
