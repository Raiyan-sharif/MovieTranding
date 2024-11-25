//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by BJIT on 22/11/24.
//

import Foundation

class MainViewModel{

    var isLoading: Obserable<Bool> = Obserable(false)
    var cellDataSource: Obserable<[MovieTableCellViewModel]> = Obserable(nil)
    var dataSource: TrandingMoviesModel?

    func numberOfSections() -> Int{
        1
    }

    func numberOfRows(in section: Int) -> Int{
        return dataSource?.results.count ?? 0
    }

    func getData(){
        if isLoading.value ?? true{
            return
        }
        isLoading.value = true
        APICaller.getTrandingMovies { [weak self] result in
            self?.isLoading.value = false
            switch result{
            case.success(let data):
//                print(data)
                self?.dataSource = data
                self?.mapCellData()

            case .failure(let error):
                print(error)
            }
        }
    }

    func mapCellData(){
        self.cellDataSource.value = self.dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
    }

    func getMovieTitle(movie: Movie) -> String{
        return movie.title
    }
}
