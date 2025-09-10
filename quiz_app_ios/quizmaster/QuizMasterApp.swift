import Resolver
import SwiftUI

@main
struct QuizMasterApp: App {
    init() {
        Resolver.registerAllServices()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = .white  // button tint (back icon)
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ZStack(alignment: .top) {
                    Color.white
                        .ignoresSafeArea()  // remove safe area background

                    DashboardScreenView()
                }
            }
            .navigationBarHidden(true)
        }
    }
}
