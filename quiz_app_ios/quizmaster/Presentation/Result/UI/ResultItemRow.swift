import SwiftUI
import SwiftUICore

struct ResultItemRow: View {
    let item: ResultData.Item

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(item.question)
                .fontWeight(.bold)

            Text(L10n.textAnswer)
                .fontWeight(.semibold)
                .padding(.top, 4)

            VStack(alignment: .leading, spacing: 4) {
                ForEach(item.correctAnswer, id: \.self) { answer in
                    Text("• \(answer)")
                        .foregroundColor(item.result ? Color.green : Color.red)
                }
            }
            .padding(.leading, 8)
            .padding(.top, 2)

            if !item.explanation.isEmpty {
                Text(item.explanation)
                    .italic()
                    .padding(.top, 4)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(UIColor.secondarySystemBackground))
                .shadow(radius: 1)
        )
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Preview
struct ResultItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ResultItemRow(item: generateMockResultData().resultItems.first!)
            .padding(16)
    }
}
