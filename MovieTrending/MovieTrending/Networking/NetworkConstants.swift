//
//  NetworkConstants.swift
//  MovieTrending
//
//  Created by BJIT on 22/11/24.
//

import Foundation


class NetworkConstants{

    public static var shared: NetworkConstants = NetworkConstants()

    private init(){
        //Singletone

    }

    public var apiKey: String{
        get{
            // API key
            return "969a04ecebb2cc96d82f7f2aa8b4c2f9"
        }
    }

    public var serverAddress: String{
        get{
            return "https://api.themoviedb.org/3/"
        }
    }

    public var imageServerAddress: String{
        get{
            return "https://image.tmdb.org/t/p/w500"
        }
    }

}
