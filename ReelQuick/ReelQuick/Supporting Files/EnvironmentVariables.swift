//
//  EnvironmentVariables.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/9/25.
//

import Foundation

struct EnvironmentVariables {
    enum Keys {
        static let apiKey = "API_KEY"
        static let baseUrl = "BASE_URL"
    }

    static let apiKey: String? = {
        EnvironmentVariables.infoDict[Keys.apiKey] as? String
    }()

    static let baseURL: String? = {
        EnvironmentVariables.infoDict[Keys.baseUrl] as? String
    }()

    private static let infoDict: [String: Any] = {
        Bundle.main.infoDictionary ?? [:]
    }()
}
