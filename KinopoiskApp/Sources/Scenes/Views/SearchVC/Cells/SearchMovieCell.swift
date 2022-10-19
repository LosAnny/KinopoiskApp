//
//  SearchMovieCell.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 17.10.2022.
//

import UIKit
import SDWebImage

class SearchMovieCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static var identifier: String {
        get {
            "SearchMovieCell"
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        score.layer.cornerRadius = 3
    }
    
    // MARK: - Setup functions
    
    static func register() -> UINib {
        UINib(nibName: "SearchMovieCell", bundle: nil)
    }
    
    func setupCell(viewModel: SearchCellViewModelProtocol) {
        self.titleLabel.text = viewModel.name
        self.dateLabel.text = viewModel.date
        self.score.text = viewModel.score
        self.movieImageView.sd_setImage(with: viewModel.image)
        
        if movieImageView.image == nil {
            movieImageView.image = UIImage(systemName: "hand.raised.slash")
        }
    }
}
