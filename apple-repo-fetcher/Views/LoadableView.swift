import Foundation
import SwiftUI

/// A wrapper view which shows different views dependent on the state of the viewModel. The initial state of LoadableViewModel is State.loading, in whcih LoadableView will show an activity indicator. When LoadableView first appears, the onAppear() will call startLoading() in the LoadableViewModel, which willl update the state to State.loaded in case of success, in this case, LoadableView will show the given content. In case of error, represented by State.error, LoadableView will show an error.

struct LoadableView<Content: View>: View {
    
    @ObservedObject var viewModel: LoadableViewModel
    let errorTitle: String
    let content: () -> Content

    /**
     Initializes the LoadableView
     - Parameters:
        - viewmodel: Any ViewModel which inherets LoadableViewModel.
        - errorTitle:A title for the ErrorView shown in the navigation bar.
        - content: The content which is shown when state in viewModel change to .loaded
     */
    public init(viewModel: LoadableViewModel, errorTitle: String, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.viewModel = viewModel
        self.errorTitle = errorTitle
    }
    
    var body: some View {
        VStack{
            switch viewModel.state {
            case .loading:
                loadingView
            case .error(let errorMessage):
                ErrorView(message: errorMessage, title: errorTitle)
            case .loaded:
                content()
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
