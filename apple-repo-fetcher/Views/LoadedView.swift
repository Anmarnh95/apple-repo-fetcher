import SwiftUI

/// LoadedView shows the list of GitRepository. 
struct LoadedView: View {
    
    var repos: [GHListRepository] = []
    var onRefresh: ()->Void = {}
    
    var body: some View {
        
        if repos.isEmpty {
            Text("No available Repos")
        } else {
            NavigationStack {
                HStack {
                    Text("Apple Repositories")
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                }
                List {
                    ForEach(repos) { repo in
                        NavigationLink(value: repo) {
                            ListItemView(repository: repo)
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
        }
    }
}

struct LoadedView_Previews: PreviewProvider {
    static var previews: some View {
        LoadedView(repos: MockRepositories.mocks, onRefresh: {})
    }
}
