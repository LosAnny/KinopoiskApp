//
//  MovieActionsViewModelProtocol.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 18.10.2022.
//

import Foundation

protocol MovieActionsViewModelProtocol {
    
    var movie: Movie { get }
    var movieId: Int { get }
    var movieImage: URL? { get }
    var movieTitle: String { get }
    var date: String { get }

    init(movie: Movie)
    func getNumberOfRows() -> Int
    func getAction(by index: Int) -> TableAction
}
