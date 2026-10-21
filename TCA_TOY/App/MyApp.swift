import SwiftUI
import ComposableArchitecture

@main
struct MyApp: App {
    static let store = Store(initialState: SessionFeature.State()){
            SessionFeature()
            ._printChanges()
    }
    var body: some Scene {
        WindowGroup {
            SessionView(store: MyApp.store)
        }
    }
}
