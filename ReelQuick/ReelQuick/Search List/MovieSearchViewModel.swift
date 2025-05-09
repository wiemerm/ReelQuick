//
//  MovieSearchViewModel.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/9/25.
//

import Combine
import SwiftUI

class MovieSearchViewModel: ObservableObject {
    @Published var movies = [Movie]()
    @Published var error: String?
    @Published var searchText: String = ""

    private var cancellables = Set<AnyCancellable>()
    private let movieService: MovieServiceProtocol

    init(movieService: MovieServiceProtocol = MovieService()) {
        self.movieService = movieService
        setUpObservers()
    }

    private func setUpObservers() {
        $searchText
            .filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink { [weak self] text in
                self?.search(for: text)
            }
            .store(in: &cancellables)

        $searchText
            .filter { $0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
            .sink { [weak self] _ in
                self?.movies = []
            }
            .store(in: &cancellables)
    }

    private func search(for text: String) {
        Task { @MainActor in
            do {
                movies = try await movieService.searchMovies(text)
            } catch {
                self.error = (error as? APIError ?? .caught(error)).userFriendlyDescription
            }
        }
    }
}
