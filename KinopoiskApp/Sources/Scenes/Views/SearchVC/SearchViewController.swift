//
//  SearchViewController.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 16.10.2022.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Популярные фильмы"
    }
}
