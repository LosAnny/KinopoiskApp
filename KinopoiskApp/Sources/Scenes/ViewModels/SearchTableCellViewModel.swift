//
//  SearchTableCellViewModel.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 17.10.2022.
//

import Foundation

final class SearchTableCellViewModel: SearchCellViewModelProtocol {
    
    var id: Int
    var name: String
    var date: String
    var score: String
    var image: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.name = movie.name ?? movie.title ?? ""
        self.date = movie.releaseDate?.truncated(after: 4) ??
                    movie.firstAirDate?.truncated(after: 4) ?? ""
        self.score = "\(round(movie.voteAverage * 10) / 10.0)"
        self.image = makeImageURL(movie.posterPath ?? "")
    }
    
    func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
