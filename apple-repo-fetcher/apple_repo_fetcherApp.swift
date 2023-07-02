import SwiftUI

@main
struct apple_repo_fetcherApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel(api: ApplePublicReposAPI()))
        }
    }
}