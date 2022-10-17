//
//  SearchViewModelProtocol.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 16.10.2022.
//

import Foundation

protocol SearchViewModelProtocol {
    var isLoading: Observable<Bool> { get set }
    var cellDataSources: Observable<[SearchCellViewModelProtocol]> { get set }
    
    func getNumberOfSections() -> Int
    func getNumberOfRows(in section: Int) -> Int
    func getData()
    func getMovieTitle(_ movie: Movie) -> String
}
