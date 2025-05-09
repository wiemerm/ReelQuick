//
//  MovieSearchViewModelTests.swift
//  ReelQuickTests
//
//  Created by Megan Wiemer on 5/9/25.
//

@testable import ReelQuick
import Combine
import XCTest

final class MovieSearchViewModelTests: XCTestCase {
    var mockMovieService: MockMovieService!
    var viewModel: MovieSearchViewModel!
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        mockMovieService = MockMovieService()
        viewModel = MovieSearchViewModel(movieService: mockMovieService)
    }

    func test_onInitialization_moviesAreEmpty() {
        XCTAssertTrue(viewModel.movies.isEmpty)
    }

    func test_onTextEntered_attemptsToFetchMovies() async {
        let expect = expectation(description: "Waiting for movies to be updated")
        let searchText = "Avengers".appendRandom()

        mockMovieService.moviesToReturn = []

        viewModel.$movies
            .dropFirst()
            .sink { _ in
                expect.fulfill()
            }
            .store(in: &cancellables)

        viewModel.searchText = searchText

        await fulfillment(of: [expect], timeout: 3)

        XCTAssertEqual(mockMovieService.searchMovieCallCount, 1)
        XCTAssertEqual(mockMovieService.queryArg, searchText)
    }

    func test_searchMovies_onSuccess_updatesMovies() async {
        let expect = expectation(description: "Waiting for movies to be updated")
        let searchText = "Avengers".appendRandom()

        let expected = [
            Movie.mock(),
            Movie.mock(),
            Movie.mock()
        ]

        mockMovieService.moviesToReturn = expected

        viewModel.$movies
            .dropFirst()
            .sink { movies in
                XCTAssertEqual(movies.count, 3)
                XCTAssertEqual(movies, expected)
                expect.fulfill()
            }
            .store(in: &cancellables)

        viewModel.searchText = searchText

        await fulfillment(of: [expect], timeout: 3)

        XCTAssertEqual(mockMovieService.searchMovieCallCount, 1)
        XCTAssertEqual(mockMovieService.queryArg, searchText)
    }

    func test_searchMovies_onFailure_throwsError() async {
        let expect = expectation(description: "Waiting for error to be updated")
        let searchText = "Avengers".appendRandom()

        let expected = APIError.decodingFailed

        mockMovieService.errorToThrow = expected

        viewModel.$error
            .dropFirst()
            .sink { error in
                XCTAssertEqual(error?.userFriendlyDescription, expected.userFriendlyDescription)
                expect.fulfill()
            }
            .store(in: &cancellables)

        viewModel.searchText = searchText

        await fulfillment(of: [expect], timeout: 3)
    }
}
