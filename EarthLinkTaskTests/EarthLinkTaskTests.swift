//
//  EarthLinkTaskTests.swift
//  EarthLinkTaskTests
//
//  Created by Muhammad Kamal on 18/08/2023.
//

import XCTest
@testable import EarthLinkTask

final class EarthLinkTaskTests: XCTestCase {
    var viewModel:AppListViewModel!
    @MainActor override func setUp() {
        super.setUp()
        viewModel = .init()
    }

    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }

    @MainActor func testFetchList_Success() throws {
        let requestExpectation = expectation(description: "Request finished")
        viewModel.fetchList { result in
            XCTAssertNil(self.viewModel.apiError)
            XCTAssertNotNil(self.viewModel.collections)
            requestExpectation.fulfill()
        }
        wait(for: [requestExpectation], timeout: 5.0)
    }


    @MainActor func testFetchList_Fail() throws {
        let requestExpectation = expectation(description: "Request finished")
        viewModel.fetchList{ result in
            XCTAssertNotNil(self.viewModel.apiError)
            XCTAssertNil(self.viewModel.collections)
            requestExpectation.fulfill()
        }
        wait(for: [requestExpectation], timeout: 5.0)
    }
}
