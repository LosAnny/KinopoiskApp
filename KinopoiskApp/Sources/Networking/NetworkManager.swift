//
//  NetworkManager.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 16.10.2022.
//

import Foundation

class NetworkManager {
    
    static func fetchMovies(completionHandler: @escaping (_ result: Result<PopularMoviesModel, NetworkError>) -> Void) {
        
        if NetworkConstant.shared.apiKey.isEmpty {
            completionHandler(.failure(.noApiKey))
            return
        }
        
        let urlString = NetworkConstant.shared.serverAddress +
                        NetworkConstant.shared.trendingAllDay +
                        NetworkConstant.shared.apiKey
                
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error.debugDescription)
            } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                
                guard let data = data else {
                    completionHandler(.failure(.canNoteParseData))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let resultData = try decoder.decode(PopularMoviesModel.self, from: data)
                    completionHandler(.success(resultData))
                } catch {
                    completionHandler(.failure(.otherError))
                }
            }
        }.resume()
    }
}
