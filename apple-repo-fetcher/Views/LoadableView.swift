import Foundation
import SwiftUI

struct LoadableView<Content: View>: View {
    
    let content: () -> Content
    let viewModel: ViewModel
    let errorTitle: String
    
    public init(viewModel: ViewModel, errorTitle: String, @ViewBuilder content: @escaping () -> Content) {
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
