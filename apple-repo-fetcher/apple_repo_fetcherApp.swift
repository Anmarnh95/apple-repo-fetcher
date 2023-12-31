import SwiftUI

@main
struct apple_repo_fetcherApp: App {
    var body: some Scene {
        WindowGroup {
            RepositoryListView(viewModel: RepositoryListViewModel(api: GHApplesAPI()))
        }
    }
}
