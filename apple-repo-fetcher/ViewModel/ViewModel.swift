import Foundation


protocol ViewModel {
    var state: State { get set }
    func startLoading() -> Void
}
