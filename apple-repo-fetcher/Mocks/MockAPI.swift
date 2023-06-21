import Foundation
import Combine

class mockAPI:API {
    
    private var returnError: NetworkError = .decodingError
    private var returnValues: [GitRepository] = MockRepositories.mocks
    
    
    public var returnKind: neededReturnKind
    
    init(returnKind: neededReturnKind) {
        self.returnKind = returnKind
    }
    
    func fetchRepositories() -> AnyPublisher<[GitRepository], NetworkError> {
        switch returnKind {
        case .error:
            return Fail(error: returnError).eraseToAnyPublisher()
        case .values:
            return Just(returnValues)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        }
    }
}

extension mockAPI {
    public enum neededReturnKind {
        case error
        case values
    }
}
