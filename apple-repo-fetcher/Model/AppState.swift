import Foundation

/// An enum that descripes a state.

public enum State: Equatable {
    case loading
    case loaded
    case error(_ errorMessage: String)
}
