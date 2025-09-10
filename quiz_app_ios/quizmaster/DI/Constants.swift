struct Constants {
    #if DEBUG
        static let baseURL = "https://mrkivan.github.io/quiz_app_data/"
    #elseif STAGING
        static let baseURL = "https://mrkivan.github.io/quiz_app_data/"
    #else
        static let baseURL = "https://mrkivan.github.io/quiz_app_data/"
    #endif
}
