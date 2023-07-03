import SwiftUI

struct RepositoryListView: View {
    
    var onRefresh: ()->Void = {}
    @ObservedObject var viewModel: RepositoryListViewModel
    
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
                        
                        let selectedViewModel = RepositoryDetailsViewModel(api: GHApplesAPI(), repositoryName: repo.name)
                        LoadableView(viewModel: selectedViewModel, errorTitle: "\(repo.name)"){
                            if let repository = selectedViewModel.repository {
                                RepositoryDetailsView(repo: repository)
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
        RepositoryListView(viewModel: RepositoryListViewModel(api: GHApplesAPI()))
    }
}
