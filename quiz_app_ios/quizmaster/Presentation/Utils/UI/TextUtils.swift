import SwiftUI

// MARK: - Toolbar Title
struct ToolbarTitle: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title3)  // similar to MaterialTheme.typography.titleMedium
            .lineLimit(1)
            .truncationMode(.tail)
    }
}

// MARK: - Dashboard Item Title
struct TvDashboardTitle: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.blue)
            .lineLimit(2)
            .truncationMode(.tail)
    }
}

// MARK: - Quiz Body Title
struct TvQuizBodyTitle: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.title3)  // titleMedium
            .lineLimit(1)
            .truncationMode(.tail)
    }
}

// MARK: - Quiz Body Description
struct TvQuizBodyDesc: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.body)  // bodyMedium
            .lineLimit(2)
            .truncationMode(.tail)
    }
}

// MARK: - Medium Text
struct TvMedium: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.body)  // bodyMedium
    }
}

// MARK: - Large Text
struct TvLarge: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.title2)  // adjust as needed
    }
}

// MARK: - Small Headline
struct TvHeadSmall: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.headline)  // headlineSmall
    }
}

// MARK: - Result Title
struct TvResultTitle: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.title3)  // titleMedium
            .fontWeight(.bold)
    }
}

// MARK: - Result Section Title
struct TvResultSectionTitle: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.title3)  // titleSmall equivalent
            .fontWeight(.semibold)
    }
}
