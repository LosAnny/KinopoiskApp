//
//  SearchVC+TableViewExtensions.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 17.10.2022.
//

import UIKit

// MARK: - Setup tableView

extension SearchViewController {
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(SearchMovieCell.register(), forCellReuseIdentifier: SearchMovieCell.identifier)
        
        self.tableView.backgroundColor = .systemBackground
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - DataSource tableView

extension SearchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.getNumberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        viewModel?.getNumberOfRows(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchMovieCell.identifier,
                                                       for: indexPath) as? SearchMovieCell else {
            return UITableViewCell()
        }
        let cellViewModel = cellDataSources[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - Delegate tableView

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movieID = cellDataSources[indexPath.row].id
        guard let movie = viewModel?.getMovieWith(id: movieID) else { return }
        
        let viewModel = DetailMovieViewModel(movie: movie)
        let viewController = DetailMovieViewController(viewModel: viewModel)

        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        let movieID = cellDataSources[indexPath.row].id
        guard let movie = viewModel?.getMovieWith(id: movieID) else { return }
        
        let viewModel = MovieActionViewModel(movie: movie)
        let viewController = MovieActionsViewController(viewModel: viewModel)
        
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        
        present(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
