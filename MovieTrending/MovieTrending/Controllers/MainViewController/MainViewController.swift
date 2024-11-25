//
//  MainViewController.swift
//  MovieTrending
//
//  Created by BJIT on 21/11/24.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - IBOutlets:
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - ViewModel:
    var viewModel: MainViewModel = MainViewModel()

    //MARK: - Variables
    var cellDataSource: [MovieTableCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        bindViewModel()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }

    func configView(){
        self.title = "Main View"
        self.view.backgroundColor = .systemBackground
        
        setUpTableView()
    }

    func bindViewModel(){
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else{
                return
            }
            DispatchQueue.main.async {
                if isLoading{
                    self.activityIndicator.startAnimating()
                }else{
                    self.activityIndicator.stopAnimating()
                }
            }
        }

        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else{
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()

        }
    }

    func openDetails(movieId: Int){
        guard let movie = viewModel.retrieveMovie(with: movieId) else{
            return
        }

        let detailsViewModel = DetailsMovieViewModel.init(movie: movie)
        let detalViewController = DetailsMovieViewController(viewMode: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detalViewController, animated: true)
        }
    }

}
