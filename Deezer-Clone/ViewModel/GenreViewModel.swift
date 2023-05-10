//
//  GenreViewModel.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 10.05.2023.
//

import Foundation

class GenreViewModel {
    var genres: [Genre] = []
    
    func fetchGenres(completion: @escaping() -> Void) {
        APINetwork.shared.getGenres { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let genres):
                self.genres = genres
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
