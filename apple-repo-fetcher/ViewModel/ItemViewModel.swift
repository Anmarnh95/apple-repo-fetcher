import Foundation

final class ItemViewModel: ObservableObject {
    
    private let api: API
    private let repositoryName: String
    
    //@Published private var repository: GHFullRepository
    
    init(api: API, repositoryName: String) {
        self.repositoryName = repositoryName
        self.api = api
    }
}
