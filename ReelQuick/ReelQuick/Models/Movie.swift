//
//  Movie.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/8/25.
//

import Foundation

struct Movie: Codable, Identifiable {
    let id: String
    let title: String
    let overview: String
    let releaseDate: String
    let posterPath: String
    let voteAverage: Double

    var posterImageURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/original\(posterPath)")
    }

    var releaseDateDate: Date? {
        releaseDate.toDate()
    }
}

struct MovieSearchResults: Codable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [Movie]
}

#if DEBUG
extension Movie {
    static func mock(
        id: String = UUID().uuidString,
        title: String = "Halo 4: Forward Unto Dawn",
        // swiftlint:disable:next line_length
        overview: String = "UNSC Cadet Thomas Lasky must conquer his inner fears and join forces with super-soldier John-117 to take down a massive faction of the Covenant.",
        releaseDate: String = "2012-10-25",
        posterPath: String = "/psGuDt6GLpdkPYjnHWPLGCZ5SrR.jpg",
        voteAverage: Double = 8.5
    ) -> Movie {
        Movie(
            id: id,
            title: title,
            overview: overview,
            releaseDate: releaseDate,
            posterPath: posterPath,
            voteAverage: voteAverage
        )
    }
}
#endif
