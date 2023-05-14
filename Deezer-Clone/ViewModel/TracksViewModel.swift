//
//  TracksViewModel.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 13.05.2023.
//

import Foundation

class TrackViewModel {
    var tracks: [Track] = []
    
    func fetchTracksById(_ id: Int, completion: @escaping() -> Void) {
        APINetwork.shared.getTracksById(id) { [weak self] result in
            switch result {
            case .success(let track):
                self?.tracks = track
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
