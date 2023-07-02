import SwiftUI

/// LoadedView shows the list of GitRepository. 
struct LoadedView: View {
    
    var repos: [GHListRepository] = []
    var onRefresh: ()->Void = {}
    
    var body: some View {
        
        if repos.isEmpty {
            Text("No available Repos")
                .navigationTitle("Apple Repositories")
        } else {
            NavigationStack {
                List {
                    ForEach(repos) { repo in
                        NavigationLink(value: repo) {
                            RepositoryListView(repository: repo)
                        }
                    }
                }
                .navigationDestination(for: GHListRepository.self){ repo in
                    RepositoryPageView(viewModel:ItemViewModel(api: ApplePublicReposAPI(), repositoryName: repo.name) )
                }
                .refreshable {
                    onRefresh()
                }
                .listStyle(.plain)
            }
            .navigationTitle("Apple Repositories")
        }
    }
}

struct LoadedView_Previews: PreviewProvider {
    static var previews: some View {
        LoadedView(repos: Mocks.mockRepositoryList, onRefresh: {})
    }
}
