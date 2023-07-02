import Foundation
import Combine

/// A protocol  holding the relevant API call for fetching the GitRepositories from backend, decoding it into an array of GitRepositories.
protocol API {
    func fetchRepositories() -> AnyPublisher<[GitRepository], NetworkError>
}