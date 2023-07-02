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
        ListItemView(repository: MockRepositories.mocks[1])
            .previewLayout(.fixed(width: 300, height: 70))
        ListItemView(repository:MockRepositories.mocks[4])
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
