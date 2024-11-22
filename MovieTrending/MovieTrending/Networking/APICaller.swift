//
//  APICaller.swift
//  MovieTrending
//
//  Created by BJIT on 22/11/24.
//

import Foundation


enum NetworkError: Error{
    case urlError
    case canNotParseData
}

public class APICaller{

    static func getTrandingMovies( completionHandler: @escaping(_ result: Result<TrandingMoviesModel,NetworkError>) -> Void) {
        let urlString = NetworkConstants.shared.serverAddress + "trending/movie/day?api_key=" + NetworkConstants.shared.apiKey

        guard let url = URL(string: urlString) else{
            completionHandler(.failure(.urlError))
            return
        }

        URLSession.shared.dataTask(with: url){ dataResponse, urlResponse, error in
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(TrandingMoviesModel.self, from: data){
                
                completionHandler(.success(resultData))
            }
            else{
                completionHandler(.failure(.canNotParseData))
            }

        }.resume()
    }
}
