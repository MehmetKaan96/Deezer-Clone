//
//  ArtistViewModel.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 10.05.2023.
//

import Foundation

class ArtistViewModel {
    var artists: [Artist] = []
    
    func fetchGenreArtist(by id: Int, completion: @escaping() -> Void) {
        APINetwork.shared.getArtistsByGenre(id) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let artists):
                self.artists = artists
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
