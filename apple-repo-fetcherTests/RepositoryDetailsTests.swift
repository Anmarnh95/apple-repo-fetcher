import XCTest
@testable import apple_repo_fetcher

final class RepositoryDetailsTests: XCTestCase {

    func testStartUpState() throws {
        let viewModel = RepositoryDetailsViewModel(api: mockAPI(returnKind: .values), repositoryName: "Test")
        XCTAssertEqual(viewModel.state, State.loading)
        XCTAssertNil(viewModel.repository)
    }
    
    func testAfterFetchState() throws {
        let viewModel = RepositoryDetailsViewModel(api: mockAPI(returnKind: .values), repositoryName: "Test")
        viewModel.startLoading()
        let pred = NSPredicate { viewModel, _ in
            ((viewModel as? RepositoryDetailsViewModel)?.state) != State.loading
            
        }
        let expectation = XCTNSPredicateExpectation(predicate: pred, object: viewModel)
        self.wait(for: [expectation], timeout: 10)
        XCTAssertEqual(viewModel.state, State.loaded)
        XCTAssertNotNil(viewModel.repository)
    }
    
    func testFailureState() throws {
        let viewModel = RepositoryDetailsViewModel(api: mockAPI(returnKind: .error), repositoryName: "Test")
        viewModel.startLoading()
        let pred = NSPredicate { viewModel, _ in
            ((viewModel as? RepositoryDetailsViewModel)?.state) != State.loading
        }
        let expectation = XCTNSPredicateExpectation(predicate: pred, object: viewModel)
        self.wait(for: [expectation], timeout: 10)
        XCTAssertEqual(viewModel.state, State.error("Decoding Error: Unable to decode backend response"))
        XCTAssertNil(viewModel.repository)
    }

}
