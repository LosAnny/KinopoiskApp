//
//  Movie.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 16.10.2022.
//

import Foundation

struct Movie: Codable {
    
    let backdropPath: String?
    let id: Int
    let title: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double
    let voteCount: Int
    let name: String?
    let originalName, firstAirDate: String?
}
