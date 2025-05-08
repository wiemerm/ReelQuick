//
//  MovieSearchView.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/8/25.
//

import SwiftUI

struct MovieSearchView: View {
    // Temp for setting up view
    let movies = [
        Movie.mock(),
        Movie.mock(),
        Movie.mock(),
        Movie.mock(),
        Movie.mock()
    ]

    var body: some View {
        VStack {
            List(movies) {
                MovieListItem(movie: $0)
                    .overlay {
                        NavigationLink {
                            MovieDetailView()
                        } label: {
                            EmptyView()
                        }.opacity(0)
                    }
            }
            .listStyle(.plain)
        }
        .overlay {
            if movies.isEmpty {
                ContentUnavailableView.init("", image: "", description: Text("No Results"))
            }
        }
        .searchable(text: .constant(""))
        .onAppear {
            UISearchBar.appearance().showsCancelButton = false
        }
        .searchPresentationToolbarBehavior(.avoidHidingContent)
        .navigationTitle(Text("Movie Search"))
        .navigationBarTitleDisplayMode(.large)
    }
}

#if DEBUG
#Preview {
    NavigationStack {
        MovieSearchView()
    }
}
#endif
