import Foundation
import Combine


/// A fake API used for testing porposes.

final class mockAPI:API {
    
    private var returnError: NetworkError = .decodingError
    private var listReturn: [GHListRepository] = Mocks.mockRepositoryList
    private var singleReturn: GHFullRepository = Mocks.mockRepository
    
    
    public var returnKind: neededReturnKind
    
    init(returnKind: neededReturnKind) {
        self.returnKind = returnKind
    }
    
    func fetchRepositories() -> AnyPublisher<[GHListRepository], NetworkError> {
        switch returnKind {
        case .error:
            return Fail(error: returnError).eraseToAnyPublisher()
        case .values:
            return Just(listReturn)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        }
    }
    
    func fetchRepositoryByName(name: String) -> AnyPublisher<GHFullRepository, NetworkError> {
        switch returnKind {
        case .error:
            return Fail(error: returnError).eraseToAnyPublisher()
        case .values:
            return Just(singleReturn)
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
