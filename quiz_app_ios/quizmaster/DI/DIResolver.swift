import Alamofire
import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        // MARK: - Core
        register { Constants.baseURL }

        // MARK: - Cache
        register { CacheManager() }

        // MARK: - Session
        register { () -> Session in
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 30
            configuration.timeoutIntervalForResource = 60
            let monitors: [EventMonitor] = [NetworkLogger()]
            return Session(
                configuration: configuration,
                eventMonitors: monitors
            )
        }

        // MARK: - API
        register {
            QuizAPIService(baseURL: resolve(), session: resolve()) as QuizAPI
        }

        // MARK: - Repository
        register {
            QuizRepositoryImpl(api: resolve(), cache: resolve())
                as QuizRepository
        }

        // MARK: - UseCases
        register { GetDashboardDataUseCase(repository: resolve()) }
        register { GetQuizDataBySetAndTopicUseCase(repository: resolve()) }
        register { GetQuizSetListUseCase(repository: resolve()) }
        register { GetResultDataUseCase(cacheManager: resolve()) }
        register { SaveResultDataUseCase(cacheManager: resolve()) }
    }
}
