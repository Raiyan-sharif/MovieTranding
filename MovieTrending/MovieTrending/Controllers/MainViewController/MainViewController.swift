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
    var cellDataSource: [Movie] = []

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
        self.view.backgroundColor = .red
        
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
