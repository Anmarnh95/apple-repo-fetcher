import Foundation
import Combine

final class ItemViewModel: ObservableObject {
    
    var cancellableSet: Set<AnyCancellable> = []
    
    private let api: API
    private let repositoryName: String
    
    @Published private(set) var repository: GHFullRepository? = nil
    
    init(api: API, repositoryName: String) {
        self.repositoryName = repositoryName
        self.api = api
    }
    
    public func startLoading() -> Void {
        print("ItemViewModel: Will start loading")
        api.fetchRepositoryByName(name: self.repositoryName)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("ItemViewModel: Successfully finished")
                    // Success, change state to loaded
                    break
                case .failure(let error):
                    print("ItemViewModel: Finished with failure")
                    // failure, change state to error
                }
            }, receiveValue: { repository in
                print("ItemViewModel: Repos updated")
                // Success, store decoded GitRepository array
                self.repository = repository
            })
            .store(in: &cancellableSet)
    }
}
