import Foundation
import Combine

final class RepositoryListViewModel: ViewModel{
    
    var cancellableSet: Set<AnyCancellable> = []
    
    @Published public private(set) var repos: [GHListRepository] = []
        
    private let api: API
    
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
