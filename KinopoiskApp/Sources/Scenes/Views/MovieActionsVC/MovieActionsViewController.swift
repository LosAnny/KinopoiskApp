//
//  MovieActionsViewController.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 18.10.2022.
//

import UIKit

class MovieActionsViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MovieActionsViewModelProtocol?
    
    // MARK: - Initial
    
    init(viewModel: MovieActionsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "MovieActionsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTableView()
    }
    
    // MARK: - Setup
    
    func setupView() {
        titleLabel.text = viewModel?.movieTitle
        dateLabel.text = viewModel?.date
        
        movieImage.sd_setImage(with: viewModel?.movieImage)
        
        if movieImage.image == nil {
            movieImage.image = UIImage(systemName: "hand.raised.slash")
        }
    }
}

extension MovieActionsViewController {
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self,
                                forCellReuseIdentifier: "MovieActionCell")
    }
    
    
}

extension MovieActionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.getNumberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieActionCell",
                                                 for: indexPath) 
        
        let action = viewModel?.getAction(by: indexPath.row)
        cell.textLabel?.text = action?.text
        cell.imageView?.image = UIImage(systemName: action?.imageName ?? "")
        cell.selectionStyle = .none
        cell.tintColor = .label

        return cell
    }
}

extension MovieActionsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
