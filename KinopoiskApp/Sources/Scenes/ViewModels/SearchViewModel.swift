//
//  SearchViewModel.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 16.10.2022.
//

import Foundation

class SearchViewModel: SearchViewModelProtocol {
    
    func getNumberOfSections() -> Int {
        return 1
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        return 20
    }
}
