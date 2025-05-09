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
    @Published var searchText: String = ""

    private var cancellables = Set<AnyCancellable>()

    init() {
        setUpObservers()
    }

    private func setUpObservers() {
        $searchText
            .filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink { [weak self] text in
                // Search for the entered text
            }
            .store(in: &cancellables)

        $searchText
            .filter { $0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
            .sink { [weak self] text in
                self?.movies = []
            }
            .store(in: &cancellables)
    }
}
