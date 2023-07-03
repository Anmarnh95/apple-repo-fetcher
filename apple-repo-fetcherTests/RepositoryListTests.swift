import XCTest
@testable import apple_repo_fetcher

final class RepositoryListTests: XCTestCase {

    func testStartUpState() throws {
        let viewModel = RepositoryListViewModel(api: mockAPI(returnKind: .values))
        XCTAssertEqual(viewModel.state, State.loading)
        XCTAssertTrue(viewModel.repos.isEmpty)
    }
    
    func testAfterFetchState() throws {
        let viewModel = RepositoryListViewModel(api: mockAPI(returnKind: .values))
        viewModel.startLoading()
        let pred = NSPredicate { viewModel, _ in
            ((viewModel as? RepositoryListViewModel)?.state) != State.loading
            
        }
        let expectation = XCTNSPredicateExpectation(predicate: pred, object: viewModel)
        self.wait(for: [expectation], timeout: 10)
        XCTAssertEqual(viewModel.state, State.loaded)
        XCTAssertFalse(viewModel.repos.isEmpty)
    }
    
    func testFailureState() throws {
        let viewModel = RepositoryListViewModel(api: mockAPI(returnKind: .error))
        viewModel.startLoading()
        let pred = NSPredicate { viewModel, _ in
            ((viewModel as? RepositoryListViewModel)?.state) != State.loading
        }
        let expectation = XCTNSPredicateExpectation(predicate: pred, object: viewModel)
        self.wait(for: [expectation], timeout: 10)
        XCTAssertEqual(viewModel.state, State.error("Decoding Error: Unable to decode backend response"))
        XCTAssertTrue(viewModel.repos.isEmpty)
    }

}
