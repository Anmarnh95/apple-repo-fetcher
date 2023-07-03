import Foundation
import Combine
 
/// A class holding the relevant API call for fetching the github repositories of Apple from backend,.
final class GHApplesAPI: API {
    
    /// Used to fetch public repository information from github apple repositories API. By success, an array of GHListRepository is returned, by Failure, a NetworkError is thrown.
    func fetchRepositories() -> AnyPublisher<[GHListRepository], NetworkError> {
        let urlString = "https://api.github.com/orgs/apple/repos"
        guard let url = URL(string: urlString) else {
            print("GitHubAPI: Failed to parse URL")
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/vnd.github+json", forHTTPHeaderField: "Accept")
        request.addValue("2022-11-28", forHTTPHeaderField: "X-GitHub-Api-Version")
        request.addValue("public", forHTTPHeaderField: "type")
        request.addValue("full_name", forHTTPHeaderField: "sort")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                print(response)
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw NetworkError.invalidResponse
                }
                print("GitHubAPI: Repositories Loaded")
                return data
            }
            .decode(type: [GHListRepository].self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                print("GitHubAPI: Error decoding repositories")
                return NetworkError.decodingError
            }
            .eraseToAnyPublisher()
    }
    
    /// Used to fetch a single  repository information from github apple repositories API. By success, a  of GHFulltRepository is returned, by Failure, a NetworkError is thrown. The repository is specified by the name variable.
    func fetchRepositoryByName(name: String) -> AnyPublisher<GHFullRepository, NetworkError> {
        let urlString = "https://api.github.com/repos/apple/\(name)"
        guard let url = URL(string: urlString) else {
            print("GitHubAPI: Failed to parse URL")
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/vnd.github+json", forHTTPHeaderField: "Accept")
        request.addValue("2022-11-28", forHTTPHeaderField: "X-GitHub-Api-Version")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                print(response)
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw NetworkError.invalidResponse
                }
                print("GitHubAPI: Reposiroty \(name) Loaded")
                return data
            }
            .decode(type: GHFullRepository.self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                print("GitHubAPI: Error decoding the repository \(name)")
                return NetworkError.decodingError
            }
            .eraseToAnyPublisher()
    }
}


