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
        VStack(alignment: .leading, spacing: Constants.Spacing.medium) {
            HStack(alignment: .top) {
                PosterImage(url: movie.posterImageURL)
                    .accessibilityLabel("Movie poster for \(movie.title)")
                    .accessibilityHidden(false)
                    .frame(maxHeight: Constants.ImageSize.height)

                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)

                    Text(movie.releaseDateDate?.formatted(date: .long, time: .omitted) ?? movie.releaseDate)
                        .font(.subheadline)
                        .foregroundStyle(Color.systemGray)

                    Spacer()
                        .frame(minHeight: 0, maxHeight: 36)

                    Text("Viewer Rating")
                        .font(.subheadline)

                    Text("\(String(format: "%.1f", movie.voteAverage))/10")
                        .font(.headline)

                    ProgressView(value: movie.voteAverage, total: 10)
                        .accessibilityHidden(true)
                }
            }

            Text("OVERVIEW")
                .font(.headline)
                .padding(.top, Constants.Spacing.medium)
                .foregroundStyle(Color.systemGray)

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
