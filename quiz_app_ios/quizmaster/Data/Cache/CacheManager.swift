import Foundation

final class CacheManager {
    private let userDefaults: UserDefaults
    private let appDefaults: UserDefaults
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    init(
        userDefaults: UserDefaults = .standard,
        appDefaults: UserDefaults = .standard
    ) {
        self.userDefaults = userDefaults
        self.appDefaults = appDefaults
    }

    // MARK: - Dashboard

    func saveDashboard(_ dashboard: DashboardDTO) {
        if let data = try? encoder.encode(dashboard) {
            userDefaults.set(data, forKey: Keys.dashboardData)
        }
    }

    func getDashboard() -> DashboardDTO? {
        guard let data = userDefaults.data(forKey: Keys.dashboardData) else {
            return nil
        }
        return try? decoder.decode(DashboardDTO.self, from: data)
    }

    // MARK: - Quiz

    func saveQuiz(key: String, quizList: QuizListDTO) {
        if let data = try? encoder.encode(quizList) {
            userDefaults.set(data, forKey: quizKey(key))
        }
    }

    func getQuiz(key: String) -> QuizListDTO? {
        guard let data = userDefaults.data(forKey: quizKey(key)) else {
            return nil
        }
        return try? decoder.decode(QuizListDTO.self, from: data)
    }

    // MARK: - Results

    func saveResult(key: String, result: String) {
        userDefaults.set(result, forKey: quizResultKey(key))
    }

    func getResult(key: String) -> String? {
        userDefaults.string(forKey: quizResultKey(key))
    }

    // MARK: - Cache Control

    func clear() {
        let dictionary = userDefaults.dictionaryRepresentation()
        for key in dictionary.keys
        where key.hasPrefix("quiz_") || key == Keys.dashboardData {
            userDefaults.removeObject(forKey: key)
        }
    }

    func checkAndClearCacheOnVersionChange() {
        let savedVersion = appDefaults.string(forKey: Keys.appVersion)
        let currentVersion =
            Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

        if savedVersion != currentVersion {
            clear()
            appDefaults.set(currentVersion, forKey: Keys.appVersion)
        }
    }

    // MARK: - Helpers

    private func quizResultKey(_ key: String) -> String { "quiz_result_\(key)" }
    private func quizKey(_ key: String) -> String { "quiz_\(key)" }

    private enum Keys {
        static let appVersion = "app_version"
        static let dashboardData = "dashboard_data"
    }
}
