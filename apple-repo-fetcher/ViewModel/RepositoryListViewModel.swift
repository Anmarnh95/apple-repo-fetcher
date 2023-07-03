import Foundation
import Combine

/// A view model used by views which show a list of repositories reperented by an array GHListRepository.
final class RepositoryListViewModel: LoadableViewModel{
    
    private var cancellableSet: Set<AnyCancellable> = []
    private let api: API
    
    /// An array of GHListRepository which will be updated by startLoading()
    @Published public private(set) var repos: [GHListRepository] = []
    
    /**
     Initializes the RepositoryListViewModel
     - Parameters:
        - api: The api used to fetch the array of repositories
     */
    init(api: API) {
        self.api = api
    }
    
    public override func startLoading() -> Void{
        print("ListViewModel: Will start loading")
        api.fetchRepositories()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("ListViewModel: Successfully finished")
                    // Success, change state to loaded
                    self.state = .loaded
                    break
                case .failure(let error):
                    print("ListViewModel: Finished with failure")
                    // failure, change state to error
                    self.state = .error(error.localizedDescription)
                }
            }, receiveValue: { repositories in
                print("ListViewModel: Repos updated")
                // Success, store decoded GitRepository array
                self.repos = repositories
            })
            .store(in: &cancellableSet)
    }
    
}
