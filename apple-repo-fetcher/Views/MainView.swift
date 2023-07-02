import SwiftUI

/// Main funciton of this view is choosing the right View dependend on the state AppState in the MainViewModel. It also shows the title "Apple Repositories" in all Views,
struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack{
            switch viewModel.appState {
            case .loading:
                loadingView
            case .loaded:
                LoadedView(repos: viewModel.repos, onRefresh: viewModel.startLoading)
            case .error(let errorMessage):
                ErrorView(message: errorMessage)
            }
        }
        .onAppear {
            viewModel.startLoading()
        }
    }
    
    private var loadingView: some View {
        VStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(api: ApplePublicReposAPI()))
    }
}

