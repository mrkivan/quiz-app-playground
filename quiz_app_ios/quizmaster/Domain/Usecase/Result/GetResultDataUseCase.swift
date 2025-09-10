import Combine
import Foundation

final class GetResultDataUseCase {
    private let cacheManager: CacheManager
    private let decoder: JSONDecoder

    init(cacheManager: CacheManager, decoder: JSONDecoder = JSONDecoder()) {
        self.cacheManager = cacheManager
        self.decoder = decoder
    }

    func execute(key: String) -> AnyPublisher<ResultData?, Never> {
        Future<ResultData?, Never> { promise in
            guard let jsonString = self.cacheManager.getResult(key: key),
                let data = jsonString.data(using: .utf8),
                let result = try? self.decoder.decode(
                    ResultData.self,
                    from: data
                )
            else {
                promise(.success(nil))  // Return nil if decoding fails
                return
            }

            promise(.success(result))
        }
        .eraseToAnyPublisher()
    }
}
