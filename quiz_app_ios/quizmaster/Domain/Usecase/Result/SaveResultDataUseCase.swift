import Combine
import Foundation

final class SaveResultDataUseCase {
    private let cacheManager: CacheManager
    private let encoder: JSONEncoder

    init(cacheManager: CacheManager, encoder: JSONEncoder = JSONEncoder()) {
        self.cacheManager = cacheManager
        self.encoder = encoder
    }

    func execute(key: String, result: ResultData) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { promise in
            if let data = try? self.encoder.encode(result),
                let jsonString = String(data: data, encoding: .utf8)
            {
                self.cacheManager.saveResult(key: key, result: jsonString)
            }
            promise(.success(()))  // emit success
        }
        .eraseToAnyPublisher()
    }
}
