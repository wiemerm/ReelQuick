//
//  MovieResultsTests.swift
//  ReelQuickTests
//
//  Created by Megan Wiemer on 5/9/25.
//

@testable import ReelQuick
import XCTest

final class MovieResultsTests: XCTestCase {
    func test_canDecodeMovieResults() {
        let jsonFile = "search_response"
        let results: MovieResult? = Bundle(for: MovieResultsTests.self).load(json: jsonFile)

        XCTAssertNotNil(results)
    }
}
