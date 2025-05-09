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
            XCTAssertEqual((error as? APIError)?.userFriendlyDescription, expectedError.userFriendlyDescription)
            XCTAssertEqual(mockAPIClient.fetchCallCount, 1)
        }
    }

    func test_searchMovies_callsThroughToAPIClient_onSuccess() async throws {
        let query = "query".appendRandom()

        let expectedMovies = [
            Movie.mock(),
            Movie.mock(),
            Movie.mock()
        ]

        mockAPIClient.movieResultToReturn = MovieResult(
            page: 1,
            totalPages: 1,
            totalResults: 3,
            results: expectedMovies
        )

        do {
            let result = try await movieService.searchMovies(query)
            XCTAssertFalse(result.isEmpty)
            XCTAssertEqual(result, expectedMovies)
        } catch {
            XCTFail("Expected the search movies to not fail")
        }
    }
}
