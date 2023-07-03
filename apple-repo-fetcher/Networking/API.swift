import Foundation
import Combine

/// A protocol  holding the relevant API call for fetching git repositories  from an endpoint.
protocol API {
    func fetchRepositories() -> AnyPublisher<[GHListRepository], NetworkError>
    func fetchRepositoryByName(name: String) -> AnyPublisher<GHFullRepository, NetworkError>
}
