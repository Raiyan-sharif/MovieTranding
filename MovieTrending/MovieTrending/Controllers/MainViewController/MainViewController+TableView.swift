//
//  MainViewController+TableView.swift
//  MovieTrending
//
//  Created by Raiyan Sharif on 22/11/24.
//
import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate{

    func setUpTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.tableView.backgroundColor = .clear

        registerCells()
    }

    func registerCells(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = self.viewModel.getMovieTitle(movie: self.cellDataSource[indexPath.row])

        return cell
    }
    

}
