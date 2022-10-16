//
//  SearchViewModelProtocol.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 16.10.2022.
//

import Foundation

protocol SearchViewModelProtocol {
    func getNumberOfSections() -> Int
    func getNumberOfRows(in section: Int) -> Int
    func getData()
}
