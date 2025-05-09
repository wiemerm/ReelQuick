//
//  MockAPIClient.swift
//  ReelQuickTests
//
//  Created by Megan Wiemer on 5/9/25.
//

@testable import ReelQuick
import Foundation

class MockAPIClient: APISendable {
    var errorToThrow: Error?
    var movieResultToReturn: MovieResult?

    private(set) var fetchCallCount = 0

    func fetch<T>(_ endpoint: Endpoint) async throws -> T where T: Decodable {
        fetchCallCount += 1

        if let result = movieResultToReturn as? T {
            return result
        } else if let errorToThrow = errorToThrow {
            throw errorToThrow
        }

        throw APIError.invalidURL
    }
}
