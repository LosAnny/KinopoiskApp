//
//  DetailMovieViewModel.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 17.10.2022.
//

import Foundation

final class DetailMovieViewModel: DetailViewModelProtocol {
    
    var movie: Movie
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var date: String
    var score: String
    var scoreCount: String
    var movieId: Int
    
    init(movie: Movie) {
        self.movie = movie
     
        self.movieId = movie.id
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDescription = movie.overview ?? ""
        
        if movie.releaseDate?.isEmpty ?? true && movie.firstAirDate?.isEmpty ?? true {
            self.date = ""
        } else {
            self.date = movie.releaseDate?.truncated(after: 4) ??
            movie.firstAirDate?.truncated(after: 4) ?? ""
        }
        
        self.score = "\(round(movie.voteAverage * 10) / 10.0)"
        self.scoreCount = "\(movie.voteCount) оценок"
        
        self.movieImage = makeImageURL(movie.backdropPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
