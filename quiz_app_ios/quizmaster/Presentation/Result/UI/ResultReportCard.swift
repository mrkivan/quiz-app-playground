// MARK: - Result Report Card

import SwiftUI
import SwiftUICore

struct ResultReportCard: View {
    let data: ResultScreenData

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let desc = data.quizDescription {
                Text(desc)
                    .font(.body)
                    .fontWeight(.bold)
            }

            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(L10n.textTotalQuestions(data.totalQuestions))
                    Text(L10n.textCorrectAnswers(data.totalCorrectItems))
                }

                Spacer()

                CircularPercentageProgress(
                    progress: Double(data.resultPercentage) / 100.0,
                    size: 60,
                    strokeWidth: 6,
                    progressColor: .green,
                    backgroundColor: .gray.opacity(0.3),
                    percentageTextStyle: .system(size: 20)
                )
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(UIColor.secondarySystemBackground))
                    .shadow(radius: 1)
            )
        }
    }
}
