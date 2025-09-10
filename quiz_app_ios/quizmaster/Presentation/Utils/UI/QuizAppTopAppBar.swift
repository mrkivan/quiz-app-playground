import SwiftUI

struct NavigationBarConfig {
    var title: String
    var navAction: (() -> Void)? = nil  // optional custom action for back
    var useLargeTitle: Bool = false
}

extension View {
    func appNavigationBar(_ config: NavigationBarConfig) -> some View {
        self
            .navigationTitle(config.title)
            .navigationBarTitleDisplayMode(
                config.useLargeTitle ? .large : .inline
            )
            .toolbar {
                // Only show custom leading button if navAction is provided
                if let navAction = config.navAction {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: navAction) {
                            Image(systemName: "chevron.backward")
                                .imageScale(.large)
                        }
                        .accessibilityLabel(Text("Back"))
                    }
                }
            }
            // Hide the default back button if we show a custom one
            .navigationBarBackButtonHidden(config.navAction != nil)
    }
}
