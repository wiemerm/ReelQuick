//
//  MovieServiceTests.swift
//  ReelQuickTests
//
//  Created by Megan Wiemer on 5/9/25.
//

@testable import ReelQuick
import XCTest

final class MovieServiceTests: XCTestCase {
    var mockAPIClient: MockAPIClient!
    var movieService: MovieService!

    override func setUpWithError() throws {
        mockAPIClient = MockAPIClient()
        movieService = MovieService(apiClient: mockAPIClient)
    }

    func test_searchMovies_callsThroughToAPIClient() async throws {
        let query = "query".appendRandom()
        let expectedError = APIError.decodingFailed

        mockAPIClient.errorToThrow = expectedError

        do {
            _ = try await movieService.searchMovies(query)
            XCTFail("Expected the search movies to fail")
        } catch {
            XCTAssertEqual(error as? APIError, expectedError)
            XCTAssertEqual(mockAPIClient.fetchCallCount, 1)
        }
    }
}
