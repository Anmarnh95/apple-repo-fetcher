import Foundation
import Combine

/// A view model used by views which show details information about a repository.
final class RepositoryDetailsViewModel: LoadableViewModel {
    
    private var cancellableSet: Set<AnyCancellable> = []
    private let api: API
    private let repositoryName: String

    /// An instance of GHFullRepository which will be updated by startLoading()
    @Published private(set) var repository: GHFullRepository? = nil
    
    
    /**
     Initializes the RepositoryDetailsViewModel
     - Parameters:
        - api: The api used to fetch the details page
        - repositoryName: The name of the repository which will be fetched.
     */
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
