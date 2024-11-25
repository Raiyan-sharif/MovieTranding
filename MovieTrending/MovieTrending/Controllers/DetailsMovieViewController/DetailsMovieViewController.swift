//
//  DetailsMovieViewController.swift
//  MovieTrending
//
//  Created by BJIT on 25/11/24.
//

import UIKit
import SDWebImage

class DetailsMovieViewController: UIViewController {

    //IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    //View Model
    var viewModel: DetailsMovieViewModel

    init(viewMode: DetailsMovieViewModel){
        self.viewModel = viewMode
        super.init(nibName: "DetailsMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        // Do any additional setup after loading the view.
    }

    func configView(){
        self.title = "Movie Details"
        titleLabel.text = viewModel.movieTitle
        descriptionLabel.text = viewModel.movieDescription
        imageView.sd_setImage(with: viewModel.movieImage)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
