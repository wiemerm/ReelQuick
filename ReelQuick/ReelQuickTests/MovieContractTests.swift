//
//  MovieContractTests.swift
//  ReelQuickTests
//
//  Created by Megan Wiemer on 5/9/25.
//

@testable import ReelQuick
import XCTest

final class MovieContractTests: XCTestCase {
    func test_canFetchMoviesViaQueryAndDecode() async {
        let client = APIClient.shared
        let endpoint = MovieEndpoint.search(query: "Lego")

        do {
            let movieResults: MovieResult = try await client.fetch(endpoint)

            XCTAssertFalse(movieResults.results.isEmpty)
        } catch {
            XCTFail("Should not have failed the request")
        }
    }
}
