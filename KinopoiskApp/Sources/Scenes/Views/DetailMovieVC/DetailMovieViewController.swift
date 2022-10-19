//
//  DetailMovieViewController.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 17.10.2022.
//

import UIKit
import SDWebImage

class DetailMovieViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    
    @IBOutlet weak var voteButton: UIButton!
    @IBOutlet weak var scheduleButton: UIButton!
    
    var viewModel: DetailViewModelProtocol?
    
    // MARK: - Initial
    
    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "DetailMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupNavigationController() {
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.tintColor = .label
    }
    
    func setupView() {
        titleLabel.text = viewModel?.movieTitle
        descriptionLabel.text = viewModel?.movieDescription
        score.text = (viewModel?.score ?? "0") + " / 10 ★"
        date.text = viewModel?.date
        
        voteLabel.text = viewModel?.score
        voteCountLabel.text = viewModel?.scoreCount
        
        imageView.sd_setImage(with: viewModel?.movieImage)
        
        if imageView.image == nil {
            imageView.image = UIImage(systemName: "hand.raised.slash")
        }
        
        setupButton()
    }
    
    func setupButton() {
        voteButton.setCornerRadius(with: 25)
        scheduleButton.setCornerRadius(with: 25)
    }
}
