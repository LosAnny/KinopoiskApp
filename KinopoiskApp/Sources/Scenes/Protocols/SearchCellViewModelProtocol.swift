//
//  SearchCellViewModelProtocol.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 17.10.2022.
//

import Foundation

protocol SearchCellViewModelProtocol {
    var id: Int { get }
    var name: String { get }
    var date: String { get }
    var score: String { get }
    var image: URL? { get }
    
    init(movie: Movie)
}
