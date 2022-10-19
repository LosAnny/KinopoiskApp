//
//  MovieActionViewModel.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 18.10.2022.
//

import Foundation

final class MovieActionViewModel: MovieActionsViewModelProtocol {
    
    let actions = [
        TableAction(imageName: "bookmark.fill",
                    text: "Буду смотреть"),
        TableAction(imageName: "square.and.arrow.up.fill",
                    text: "Поделиться"),
        TableAction(imageName: "plus.rectangle.on.folder.fill",
                    text: "Добавить в папку"),
        TableAction(imageName: "circle.slash.fill",
                    text: "Неинтересно")
    ]
    
    var movie: Movie
    var movieId: Int
    var movieImage: URL?
    var movieTitle: String
    var date: String
    
    init(movie: Movie) {
        self.movie = movie
     
        self.movieId = movie.id
        self.movieTitle = movie.title ?? movie.name ?? ""
        
        if movie.releaseDate?.isEmpty ?? true && movie.firstAirDate?.isEmpty ?? true {
            self.date = ""
        } else {
            self.date = movie.releaseDate?.truncated(after: 4) ??
            movie.firstAirDate?.truncated(after: 4) ?? ""
        }
        
        self.movieImage = makeImageURL(movie.backdropPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
    
    func getNumberOfRows() -> Int {
        return actions.count
    }
    
    func getAction(by index: Int) -> TableAction {
        return actions[index]
    }
}
