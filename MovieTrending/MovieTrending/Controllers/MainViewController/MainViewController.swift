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

    //MARK: - ViewModel:
    var viewModel: MainViewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()


        configView()

    }

    func configView(){
        self.title = "Main View"
        self.view.backgroundColor = .red
        setUpTableView()
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
