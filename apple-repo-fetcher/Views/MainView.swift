import SwiftUI

/// Main funciton of this view is choosing the right View dependend on the state AppState in the ListViewModel. It also shows the title "Apple Repositories" in all Views,
struct MainView: View {
    
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        LoadableView(viewModel: viewModel, errorTitle: "Apple Repositories") {
            RepositoryListView(repos: viewModel.repos, onRefresh: viewModel.startLoading)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: ListViewModel(api: ApplePublicReposAPI()))
    }
}

