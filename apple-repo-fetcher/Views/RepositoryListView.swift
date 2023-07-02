import SwiftUI

/// Main funciton of this view is choosing the right View dependend on the state AppState in the ListViewModel. It also shows the title "Apple Repositories" in all Views
/// 
/// LoadedView shows the list of GitRepository

struct RepositoryListView: View {
    
    var onRefresh: ()->Void = {}
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        LoadableView(viewModel: viewModel, errorTitle: "Apple Repositories") {
            if viewModel.repos.isEmpty {
                Text("No available Repos")
                    .navigationTitle("Apple Repositories")
            } else {
                NavigationStack {

                    List {
                        ForEach(viewModel.repos) { repo in
                            NavigationLink(value: repo) {
                                RepositoryListItemView(repository: repo)
                            }
                        }
                    }
                    .navigationTitle("Apple Repositories")
                    .navigationDestination(for: GHListRepository.self){ repo in
                        
                        let selectedViewModel = ItemViewModel(api: ApplePublicReposAPI(), repositoryName: repo.name)
                        LoadableView(viewModel: selectedViewModel, errorTitle: "\(repo.name)"){
                            if let repository = selectedViewModel.repository {
                                RepositoryPageView(repo: repository)
                            } else {
                                ErrorView(message: "Error loading Repository Page", title: repo.name)
                            }
                            
                        }
                    }
                    .refreshable {
                        onRefresh()
                    }
                    .listStyle(.plain)
                }
            }
        }
    }
}

struct LoadedView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView(viewModel: ListViewModel(api: ApplePublicReposAPI()))
    }
}
