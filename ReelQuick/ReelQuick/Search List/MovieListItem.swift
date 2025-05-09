//
//  MovieListItem.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/8/25.
//

import SwiftUI

struct MovieListItem: View {
    let movie: Movie

    var body: some View {
        HStack(alignment: .top) {
            PosterImage(url: movie.posterImageURL, movieTitle: movie.title)
                .frame(width: 72)

            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)

                if let releaseDate = movie.releaseDateDate {
                    Text(releaseDate, format: .dateTime.year())
                        .font(.subheadline)
                        .foregroundStyle(Color(.systemGray))
                } else {
                    Text(movie.releaseDate)
                        .font(.subheadline)
                        .foregroundStyle(Color(.systemGray))
                }
            }
        }
    }
}

#if DEBUG
#Preview {
    MovieListItem(movie: Movie.mock())
}
#endif
