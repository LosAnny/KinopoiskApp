//
//  NetworkConstant.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 16.10.2022.
//

import Foundation

class NetworkConstant {
    
    public static var shared = NetworkConstant()
    
    public var apiKey: String {
        get {
            return "a976bf77a118ed719df66b04ccb7b524"
        }
    }

    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }

    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
    
    public var trendingAllDay: String {
        get {
            return "trending/all/day?api_key="
        }
    }
}
