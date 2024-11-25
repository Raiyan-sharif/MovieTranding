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
        tableView.register(MainMovieCell.register(), forCellReuseIdentifier: MainMovieCell.identifier)
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieCell.identifier, for: indexPath) as? MainMovieCell else{
            return UITableViewCell()
        }

        let cellViewModel = cellDataSource[indexPath.row]
        cell.selectionStyle = .none
        cell.setUpCell(viewModel: cellViewModel)


        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = cellDataSource[indexPath.row].id
        self.openDetails(movieId: movieId)
    }


}
