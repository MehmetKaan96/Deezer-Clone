//
//  APINetwork.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 10.05.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidData
}

struct APINetwork {
    
    static let shared = APINetwork()
    
    private init() { }
    
    func getGenres(completion: @escaping(Result<[Genre], Error>) -> Void) {
        let url = URL(string: Constants.endpoint + Constants.genre)
        guard let urlString = url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: urlString) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                var decodedData = try decoder.decode(GenreResponse.self, from: data)
                completion(.success(decodedData.data))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func getArtistsByGenre(_ id: Int, completion: @escaping(Result<[Artist], Error>) -> Void) {
        let url = URL(string: Constants.endpoint + Constants.genre + "/\(id)/" + Constants.artists)
        
        guard let urlString = url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: urlString) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            do{
               let decoder = JSONDecoder()
                var decodedData = try decoder.decode(GenreArtistResponse.self, from: data)
                completion(.success(decodedData.response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
