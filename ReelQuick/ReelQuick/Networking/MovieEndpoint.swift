//
//  MovieEndpoint.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/9/25.
//

import Foundation

enum MovieEndpoint: Endpoint {
    case search(query: String)

    var path: String {
        switch self {
        case .search: return "/3/search/search-movies"
        }
    }

    var queryItems: [URLQueryItem] {
        var items = [URLQueryItem(name: "api_key", value: EnvironmentVariables.apiKey)]

        switch self {
        case .search(let query):
            items.append(URLQueryItem(name: "query", value: query))
        }

        return items
    }

    func makeRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = baseUrl
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else { return nil }

        return URLRequest(url: url)
    }
}
