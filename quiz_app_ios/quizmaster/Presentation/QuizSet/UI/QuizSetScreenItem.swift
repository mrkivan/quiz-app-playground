// MARK: - Components

import SwiftUI
import XCUIAutomation

struct QuizSetScreenItem: View {
    let quizSetItemData: QuizSetData.SectionItem
    let onItemClick: () -> Void
    let navigateToResultView: (String) -> Void

    var body: some View {
        ZStack(alignment: .leading) {
            // Main Card
            Button(action: onItemClick) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(quizSetItemData.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(2)

                    Text(quizSetItemData.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(3)

                    if let result = quizSetItemData.previousResult {
                        PreviousResultButton(resultData: result) {
                            navigateToResultView(quizSetItemData.fileName)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemBackground))
                        .shadow(
                            color: .black.opacity(0.1),
                            radius: 4,
                            x: 0,
                            y: 2
                        )
                )
            }
            .buttonStyle(.plain)
            .padding(.leading, 28)  // leave space for circle number

            // Circle with Number
            CircleWithNumber(number: quizSetItemData.position)
                .offset(x: 0, y: 0)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
    }
}

// MARK: - Previous Result Button
struct PreviousResultButton: View {
    let resultData: ResultData
    let navigateToResultView: () -> Void

    var body: some View {
        VStack {
            Spacer(minLength: 8)
            Button(action: navigateToResultView) {
                HStack {
                    Text("Previous result: \(resultData.resultPercentage)%")
                    Spacer()
                    Image(systemName: "chevron.forward")
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
        }
    }
}

// MARK: - Preview
struct QuizSetScreenItem_Previews: PreviewProvider {
    static var previews: some View {

        QuizSetScreenItem(
            quizSetItemData: QuizSetData.SectionItem.mock(),
            onItemClick: {},
            navigateToResultView: { _ in }
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
