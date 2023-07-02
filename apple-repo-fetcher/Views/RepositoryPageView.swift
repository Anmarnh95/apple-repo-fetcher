import Foundation
import SwiftUI

struct RepositoryPageView: View {
    
    var repository: GHFullRepository

    var body: some View {
        Text("Something")
    }
}

struct RepositoryPageView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryPageView(repository: Mocks.mockRepository)
    }
}
