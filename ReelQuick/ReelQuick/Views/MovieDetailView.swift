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
                PosterImage(url: movie.posterImageURL, movieTitle: movie.title)
                    .frame(maxHeight: 120)

                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)

                    Text(movie.releaseDateDate?.formatted(date: .long, time: .omitted) ?? movie.releaseDate)
                        .font(.subheadline)
                        .foregroundStyle(Color(.systemGray))

                    Spacer()
                        .frame(height: 24)

                    Text("Viewer Rating")
                        .font(.subheadline)

                    Text("\(String(format: "%.1f", movie.voteAverage))/10")
                        .font(.headline)

                    ProgressView(value: movie.voteAverage, total: 10)
                }
            }

            Text("OVERVIEW")
                .font(.headline)
                .padding(.top, 12)
                .foregroundStyle(Color(.systemGray))

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
