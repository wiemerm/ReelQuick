//
//  APIClient.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/9/25.
//

import Foundation

protocol APISendable {
    func fetch<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}

struct APIClient: APISendable {
    static let shared = APIClient()

    func fetch<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        guard let request = endpoint.makeRequest() else {
            throw APIError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIError.decodingFailed
        }
    }
}

enum APIError: Error {
    case invalidURL
    case decodingFailed
    case caught(Error)

    var userFriendlyDescription: String {
        switch self {
        case .invalidURL, .caught:
            "Something went wrong while creating your search reqeuest. Please try again later."
        case .decodingFailed:
            "We ran into a problem processing the response. Please try again later."
        }
    }
}
