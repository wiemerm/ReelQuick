//
//  MovieDetailView.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/8/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                // TODO: Accessibility label
                PosterImage(url: movie.posterImageURL)

                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)

                    // TODO: Formatting of date
                    Text(movie.releaseDate)
                        .font(.subheadline)

                    Spacer()

                    Text("Viewer Rating")
                        .font(.subheadline)

                    Text("\(String(format: "%.1f", movie.voteAverage))/10")
                        .font(.headline)

                    ProgressView(value: movie.voteAverage, total: 10)
                }
            }
            // TODO: Factor in accessibility for dynamic text
            .frame(height: 120)

            Text("OVERVIEW")
                .font(.headline)
                .padding(.top, 12)

            Text(movie.overview)

            Spacer()
        }
        .padding()
    }
}

#if DEBUG
#Preview {
    MovieDetailView(movie: Movie.mock())
}
#endif
