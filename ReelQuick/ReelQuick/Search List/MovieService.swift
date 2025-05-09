//
//  MovieService.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/9/25.
//

import Foundation

protocol MovieServiceProtocol {
    func searchMovies(_ query: String) async throws -> [Movie]
}

struct MovieService: MovieServiceProtocol {
    private let apiClient: APISendable

    init(apiClient: APISendable = APIClient.shared) {
        self.apiClient = apiClient
    }

    func searchMovies(_ query: String) async throws -> [Movie] {
        let moviesResult: MovieSearchResults = try await apiClient.fetch(MovieEndpoint.search(query: query))
        return moviesResult.results
    }
}
