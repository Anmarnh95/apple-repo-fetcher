import Foundation
import SwiftUI

struct RepositoryPageView: View {
    
    @ObservedObject var viewModel: ItemViewModel

    var body: some View {
        Text("Placeholder")
    }
}

struct RepositoryPageView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView(repository: Mocks.mockRepositoryList[1])
            .previewLayout(.fixed(width: 300, height: 70))
        RepositoryListView(repository:Mocks.mockRepositoryList[4])
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
