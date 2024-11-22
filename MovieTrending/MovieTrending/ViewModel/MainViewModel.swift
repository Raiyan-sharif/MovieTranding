//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by BJIT on 22/11/24.
//

import Foundation

class MainViewModel{
    
    func numberOfSections() -> Int{
        1
    }

    func numberOfRows(in section: Int) -> Int{
        10
    }

    func getData(){
        APICaller.getTrandingMovies { result in
            switch result{
            case.success(let data):
                print(data)

            case .failure(let error):
                print(error)
            }
        }
    }
}
