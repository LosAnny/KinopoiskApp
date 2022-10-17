//
//  SearchViewController.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 16.10.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: SearchViewModelProtocol?
    var cellDataSources = [SearchCellViewModelProtocol]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SearchViewModel()

        setupNavigationController()
        setupTableView()
        bindViewModel()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.getData()
    }
    
    // MARK: - Setup
    
    private func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Популярные фильмы"
    }
    
    private func bindViewModel() {
        viewModel?.isLoading.bind { [weak self] isLoading in
            guard let self = self,
                  let isLoading = isLoading else { return }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel?.cellDataSources.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies else { return }
            
            self.cellDataSources = movies
            self.reloadTableView()
        }
    }
}
