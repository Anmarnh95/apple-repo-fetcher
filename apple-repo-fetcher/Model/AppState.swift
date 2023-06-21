import Foundation

/// The state of the app is described by this enum. When the App starts, the initial state is "loading". When an array of GitRepository is successfully fetched from backend, the state will turn to "loaded". In case of failure, the state becomes error with an errorMessage.
public enum AppState: Equatable {
    case loading
    case loaded
    case error(_ errorMessage: String)
}
