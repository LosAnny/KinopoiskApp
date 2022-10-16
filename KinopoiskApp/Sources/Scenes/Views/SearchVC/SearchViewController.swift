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
    private var viewModel: SearchViewModelProtocol?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SearchViewModel()

        setupNavigationController()
        setupTableView()
    }
    
    // MARK: - Setup
    
    private func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Популярные фильмы"
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.tableView.backgroundColor = .systemBackground
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.getNumberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        viewModel?.getNumberOfRows(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
}
