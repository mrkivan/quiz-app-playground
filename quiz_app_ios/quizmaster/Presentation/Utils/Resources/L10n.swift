import SwiftUI

enum L10n {
    // Titles
    static let dashboardTitleKey = "dashboard_title"
    static var dashboardTitle: LocalizedStringKey {
        LocalizedStringKey(dashboardTitleKey)
    }
    static var dashboardTitleString: String {
        NSLocalizedString(dashboardTitleKey, comment: "")
    }

    // Status
    static let statusLoading = LocalizedStringKey("status_loading")
    static let statusError = LocalizedStringKey("status_error")

    // Buttons
    static let confirmButton = LocalizedStringKey("confirm_button")
    static let retryButton = LocalizedStringKey("retry_button")
    static let submitButton = LocalizedStringKey("submit_button")
    static let skipButton = LocalizedStringKey("skip_button")
    static let resultButton = LocalizedStringKey("result_button")
    static let nextButton = LocalizedStringKey("next_button")
    static let cancelButton = LocalizedStringKey("cancel_button")

    // Alerts
    static let alertSubmitAnswerTitle = LocalizedStringKey(
        "alert_submit_answer_title"
    )
    static let alertSubmitAnswerMessage = LocalizedStringKey(
        "alert_submit_answer_message"
    )

    static let alertSkipQuestionTitle = LocalizedStringKey(
        "alert_skip_question_title"
    )
    static let alertSkipQuestionMessage = LocalizedStringKey(
        "alert_skip_question_message"
    )

    static let alertExitQuizTitle = LocalizedStringKey("alert_exit_quiz_title")
    static let alertExitQuizMessage = LocalizedStringKey(
        "alert_exit_quiz_message"
    )

    static let alertExitTitle = LocalizedStringKey("alert_exit_title")
    static let alertExitMessage = LocalizedStringKey("alert_exit_message")

    // Text / Labels
    static let textPreviousResult = LocalizedStringKey("text_previous_result")
    static let textAnswer = LocalizedStringKey("text_answer")
    static let textTotalQuestions = LocalizedStringKey("text_total_questions")
    static let textCorrectAnswers = LocalizedStringKey("text_correct_answers")
    static let textCorrectItems = LocalizedStringKey("text_correct_items")
    static let textSkippedItems = LocalizedStringKey("text_skipped_items")
    static let textIncorrectItems = LocalizedStringKey("text_incorrect_items")

    // MARK: Dynamic Text (functions for placeholders)
    static func textPreviousResult(_ percentage: Int) -> String {
        String(
            format: NSLocalizedString("text_previous_result", comment: ""),
            percentage
        )
    }

    static func textTotalQuestions(_ count: Int) -> String {
        String(
            format: NSLocalizedString("text_total_questions", comment: ""),
            count
        )
    }

    static func textCorrectAnswers(_ count: Int) -> String {
        String(
            format: NSLocalizedString("text_correct_answers", comment: ""),
            count
        )
    }

    static func textCorrectItems(_ count: Int) -> String {
        String(
            format: NSLocalizedString("text_correct_items", comment: ""),
            count
        )
    }

    static func textSkippedItems(_ count: Int) -> String {
        String(
            format: NSLocalizedString("text_skipped_items", comment: ""),
            count
        )
    }

    static func textIncorrectItems(_ count: Int) -> String {
        String(
            format: NSLocalizedString("text_incorrect_items", comment: ""),
            count
        )
    }
}
