enum DashboardIntent {
    case loadDashboard
    case navigateToQuizSets(DashboardData.Item)
}

enum DashboardNavEvent: Identifiable {
    case navigateToQuizSets(DashboardData.Item)

    var id: String {
        switch self {
        case .navigateToQuizSets(let item):
            return "\(item.sectionId)"
        }
    }
}
