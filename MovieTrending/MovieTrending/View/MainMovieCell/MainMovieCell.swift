//
//  MainMovieCell.swift
//  MovieTrending
//
//  Created by BJIT on 25/11/24.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {

    public static var identifier: String{
        get{
            return "MainMovieCell"
        }
    }

    public static func register() -> UINib{
        UINib(nibName: "MainMovieCell", bundle: nil)
    }

    // IBOutlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var backView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addBorder(color: .label, width: 1)
        backView.round()
        backView.backgroundColor = .lightGray
        movieImageView.round(5)
    }

    func setUpCell(viewModel: MovieTableCellViewModel){
        self.nameLable.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageURL ?? URL(string: ""))
    }

}
