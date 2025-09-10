import SwiftUI

// MARK: - Dashboard Item View
struct DashboardScreenItem: View {
    let item: DashboardData.Item
    let onClick: () -> Void

    var body: some View {
        BaseCardView(onClick: onClick) {
            HStack(alignment: .center, spacing: 0) {
                // Icon
                Image(getIconName(for: item.sectionId))
                    .resizable()
                    .frame(width: 32, height: 32)
                    .aspectRatio(contentMode: .fit)

                SpacerLargeWidth()

                // Title
                TvDashboardTitle(text: item.title)
                    .frame(maxWidth: .infinity, alignment: .leading)

                SpacerMediumWidth()

                // Total Circle
                CircleWithNumber(number: item.total)
            }
            .padding(.vertical, 8)
        }
        .padding(.horizontal, 16)
    }

    // MARK: - Icon mapping
    private func getIconName(for sectionId: Int) -> String {
        switch sectionId {
        case 1:
            return "ic_android_icon"
        case 2:
            return "ic_kotlin_icon"
        case 3:
            return "ic_java_icon"
        default:
            return "ic_android_icon"
        }
    }
}

// MARK: - Preview
struct DashboardScreenItem_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreenItem(item: mockDashboardItem) {
            // do nothing
        }
        .previewLayout(.sizeThatFits)
    }
}
