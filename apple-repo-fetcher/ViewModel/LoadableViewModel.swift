import Foundation

/// A parent class to the view models which load values from backend. This is created to be used alongside LoadableView to show specific views dependent on the state. Override startLoading to perform API operations and update state. A class was chosen over a protocol to ensure that changes in state acutally update LoadableView.
class LoadableViewModel: ObservableObject {
    
    /// describes the current state for viewed the corresponding View. The initial state is loading. When startLoading is done, the state should change to loaded. In case of a failure, the state should change to error.
    @Published public internal(set) var state: State = .loading
    
    /// Performs an API operations and updates the state.
    func startLoading() -> Void {}
}
