import Foundation

class ViewModel: ObservableObject {
    @Published public internal(set) var state: State = .loading
    func startLoading() -> Void {}
}
