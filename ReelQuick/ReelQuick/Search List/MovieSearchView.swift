//
//  MovieSearchView.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/8/25.
//

import SwiftUI

struct MovieSearchView: View {
    @StateObject var viewModel = MovieSearchViewModel()

    var body: some View {
        VStack {
            List(viewModel.movies) { movie in
                MovieListItem(movie: movie)
                    .overlay {
                        NavigationLink {
                            MovieDetailView(movie: movie)
                        } label: {
                            EmptyView()
                        }.opacity(0)
                    }
            }
            .listStyle(.plain)
        }
        .overlay {
            if viewModel.movies.isEmpty {
                ContentUnavailableView.init("", image: "", description: Text("No Results"))
            }
        }
        .searchable(text: $viewModel.searchText)
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
