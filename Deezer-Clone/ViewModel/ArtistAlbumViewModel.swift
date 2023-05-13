//
//  TrackListViewModel.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 11.05.2023.
//

import Foundation

class ArtistAlbumViewModel {
    var albums: [Album] = []
    
    func fetchAlbumsByArtistId(_ id: Int, completion: @escaping() -> Void) {
        APINetwork.shared.getAlbumsByArtistId(id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                    self.albums = response
                    completion()
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
