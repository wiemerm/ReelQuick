//
//  BundleExtensions.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/9/25.
//

import Foundation

extension Bundle {
    func load<T: Decodable>(json filename: String) -> T? {
        guard let url = url(forResource: filename, withExtension: "json") else {
            debugPrint("Failed to find \(filename) in bundle")
            return nil
        }

        do {
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            return try decoder.decode(T.self, from: jsonData)
        } catch {
            debugPrint("Could not load contents of \(filename)")
            return nil
        }
    }

}
