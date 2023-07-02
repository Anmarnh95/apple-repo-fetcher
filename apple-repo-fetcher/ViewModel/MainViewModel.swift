import Foundation
import Combine

final class MainViewModel: ObservableObject{
    
    var cancellableSet: Set<AnyCancellable> = []
    
    @Published public private(set) var appState: AppState
    @Published public private(set) var repos: [GitRepository] = []
    
    private let api: API
    
    /// When the App starts, the initial state is "loading". When an array of GitRepository is successfully fetched from backend, the state will turn to "loaded".
    init(api: API) {
        self.appState = .loading
        self.api = api
    }
    
    /// fetches the GitRepository objects from backend. In case of success, the repos array will be filed and the state will change to loaded. Otherwise it will turn the state to error alongside the error.
    public func startLoading() -> Void{
        print("MainViewModel: Will start loading")
        api.fetchRepositories()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("MainViewModel: Successfully finished")
                    // Success, change state to loaded
                    self.appState = .loaded
                    break
                case .failure(let error):
                    print("MainViewModel: Finished with failure")
                    // failure, change state to error
                    self.appState = .error(error.localizedDescription)
                }
            }, receiveValue: { repositories in
                print("MainViewModel: Repos updated")
                // Success, store decoded GitRepository array
                self.repos = repositories
            })
            .store(in: &cancellableSet)
    }
}
