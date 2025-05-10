//
//  MovieEndpointTests.swift
//  ReelQuickTests
//
//  Created by Megan Wiemer on 5/9/25.
//

@testable import ReelQuick
import XCTest

final class MovieEndpointTests: XCTestCase {
    func test_canCreateSearchRequest() {
        let query = "test".appendRandom()
        let endpoint = MovieEndpoint.search(query: query)
        let request = endpoint.makeRequest()
        let baseUrl = EnvironmentVariables.baseURL ?? ""
        let apiKey = EnvironmentVariables.apiKey ?? ""

        XCTAssertNotNil(request)
        // swiftlint:disable line_length
        XCTAssertEqual(
            request?.url?.absoluteString,
            "https://\(baseUrl)/3/search/movie?api_key=\(apiKey)&language=en-US&page=1&includeadult=false&query=\(query)"
        )
        // swiftlint:enable line_length
    }
}

extension String {
    func appendRandom() -> String {
        "\(self)-\(Int.random(in: 0..<1000))"
    }
}
