//
//  MovieTableCellViewModel.swift
//  MovieTrending
//
//  Created by BJIT on 25/11/24.
//

import Foundation

class MovieTableCellViewModel{
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageURL: URL?

    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.date = movie.releaseDate
        self.rating = "\(movie.voteAverage)/10"
        self.imageURL = makeImageURL(movie.posterPath)
    }


    private func makeImageURL(_ imageCode: String) -> URL?{
        URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imageCode)?api_key=\(NetworkConstants.shared.apiKey)")
    }
}
