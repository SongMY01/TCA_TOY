import SwiftUI
import ComposableArchitecture

@main
struct MyApp: App {
    static let store = Store(initialState: AppFeature.State(session: SessionFeature.State())) {
        AppFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: MyApp.store)
        }
    }
}
