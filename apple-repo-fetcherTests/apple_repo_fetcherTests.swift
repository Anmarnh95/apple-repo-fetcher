import XCTest
@testable import apple_repo_fetcher

final class apple_repo_fetcherTests: XCTestCase {

    func testStartUpState() throws {
        let viewModel = MainViewModel(api: mockAPI(returnKind: .values))
        XCTAssertEqual(viewModel.appState, AppState.loading)
        XCTAssertTrue(viewModel.repos.isEmpty)
    }
    
    func testAfterFetchState() throws {
        let viewModel = MainViewModel(api: mockAPI(returnKind: .values))
        viewModel.startLoading()
        let pred = NSPredicate { viewModel, _ in
            ((viewModel as? MainViewModel)?.appState) != AppState.loading
            
        }
        let expectation = XCTNSPredicateExpectation(predicate: pred, object: viewModel)
        self.wait(for: [expectation], timeout: 10)
        XCTAssertEqual(viewModel.appState, AppState.loaded)
        XCTAssertFalse(viewModel.repos.isEmpty)
    }
    
    func testFailureState() throws {
        let viewModel = MainViewModel(api: mockAPI(returnKind: .error))
        viewModel.startLoading()
        let pred = NSPredicate { viewModel, _ in
            ((viewModel as? MainViewModel)?.appState) != AppState.loading
        }
        let expectation = XCTNSPredicateExpectation(predicate: pred, object: viewModel)
        self.wait(for: [expectation], timeout: 10)
        XCTAssertEqual(viewModel.appState, AppState.error("Decoding Error: Unable to decode backend response"))
        XCTAssertTrue(viewModel.repos.isEmpty)
    }

}
