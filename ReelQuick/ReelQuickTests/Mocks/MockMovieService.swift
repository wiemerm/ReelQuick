//
//  MockMovieService.swift
//  ReelQuickTests
//
//  Created by Megan Wiemer on 5/9/25.
//

@testable import ReelQuick
import Foundation

class MockMovieService: MovieServiceProtocol {
    private(set) var searchMovieCallCount: Int = 0
    private(set) var queryArg: String?

    var moviesToReturn: [Movie]?
    var errorToThrow: Error?

    func searchMovies(_ query: String) async throws -> [Movie] {
        searchMovieCallCount += 1
        queryArg = query

        if let moviesToReturn {
            return moviesToReturn
        } else if let errorToThrow {
            throw errorToThrow
        }

        throw APIError.invalidURL
    }
}
