import SwiftUI

/// LoadedView shows the list of GitRepository. 
struct RepositoryListView: View {
    
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
                            RepositoryListItemView(repository: repo)
                        }
                    }
                }
                .navigationDestination(for: GHListRepository.self){ repo in
                    let itemViewModel = ItemViewModel(api: ApplePublicReposAPI(), repositoryName: repo.name)
                    
                    LoadableView(viewModel: itemViewModel, errorTitle: "\(repo.name)"){
                        RepositoryPageView(repository: itemViewModel.repository!)
                    }
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
        RepositoryListView(repos: Mocks.mockRepositoryList, onRefresh: {})
    }
}
