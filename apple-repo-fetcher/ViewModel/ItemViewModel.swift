import Foundation
import Combine

final class ItemViewModel: ViewModel {
    
    var cancellableSet: Set<AnyCancellable> = []

    @Published private(set) var repository: GHFullRepository? = nil
    
    private let api: API
    let repositoryName: String
    

    init(api: API, repositoryName: String) {
        self.repositoryName = repositoryName
        self.api = api
    }
    
    public override func startLoading() -> Void {
        
        print("ItemViewModel: Will start loading")
        api.fetchRepositoryByName(name: self.repositoryName)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("ItemViewModel: Successfully finished")
                    // Success, change state to loaded
                    self.state = .loaded
                    break
                case .failure(let error):
                    print("ItemViewModel: Finished with failure")
                    // failure, change state to error
                    self.state = .error(error.localizedDescription)
                }
            }, receiveValue: { repository in
                print("ItemViewModel: Repos updated")
                // Success, store decoded GitRepository array
                self.repository = repository
            })
            .store(in: &cancellableSet)
    }
}
