//
//  DetailsMovieViewModel.swift
//  MovieTrending
//
//  Created by BJIT on 25/11/24.
//

import Foundation

class DetailsMovieViewModel{
    var movie: Movie

    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieID: Int

    init(movie: Movie) {
        self.movie = movie

        self.movieID = movie.id
        self.movieTitle = movie.title
        self.movieDescription = movie.overview
        self.movieImage = self.makeImageURL(movie.backdropPath)

    }

    private func makeImageURL(_ imageCode: String) -> URL?{
        URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imageCode)")
    }

}
