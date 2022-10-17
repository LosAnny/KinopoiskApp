//
//  SearchViewModel.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 16.10.2022.
//

import Foundation

class SearchViewModel: SearchViewModelProtocol {
    
    var isLoading = Observable(false)
    var dataSources: PopularMoviesModel?
    var cellDataSources: Observable<[SearchCellViewModelProtocol]> = Observable(nil)
    
    func getNumberOfSections() -> Int {
        return 1
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        self.dataSources?.results.count ?? 0
    }
    
    func getData() {
        
        if isLoading.value ?? true { return }
        
        isLoading.value = true
        
        NetworkManager.fetchMovies { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                self?.dataSources = data
                self?.mapCellData()
            case .failure(let error):
                print("!!!ERROR: \(error)")
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSources.value = self.dataSources?.results.compactMap({SearchTableCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
}
