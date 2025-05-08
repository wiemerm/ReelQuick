//
//  AsyncImage+Extensions.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/8/25.
//

import SwiftUI

struct PosterImage: View {
    let url: URL?

    var body: some View {
        if let url {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fit)

            } placeholder: {
                ProgressView()
            }
        } else {
            Color(.systemGray6)
                .aspectRatio(2/3, contentMode: .fit)
        }
    }
}

#if DEBUG
#Preview {
    PosterImage(url: Movie.mock().posterImageURL)
        .padding()
}
#endif
