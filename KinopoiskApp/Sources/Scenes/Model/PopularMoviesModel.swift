//
//  PopularMoviesModel.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 16.10.2022.
//

import Foundation

struct PopularMoviesModel: Codable {
    
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int
}
