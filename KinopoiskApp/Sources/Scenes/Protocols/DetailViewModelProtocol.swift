//
//  DetailViewModelProtocol.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 17.10.2022.
//

import Foundation

protocol DetailViewModelProtocol {
    
    var movie: Movie { get }
    var movieImage: URL? { get }
    var movieTitle: String { get }
    var movieDescription: String { get }
    var date: String { get }
    var score: String { get }
    var scoreCount: String { get }
    var movieId: Int { get }
    
    init(movie: Movie)
}
