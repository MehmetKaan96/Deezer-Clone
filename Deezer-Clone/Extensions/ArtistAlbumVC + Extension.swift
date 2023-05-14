//
//  ArtistAlbumVC + Extension.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 11.05.2023.
//

import Foundation
import UIKit
import Kingfisher

extension ArtistAlbumViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumViewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.albumCell, for: indexPath) as! AlbumTableViewCell
        
        let image = URL(string: albumViewModel.albums[indexPath.row].cover)
        cell.albumImageView.kf.setImage(with: image)
        cell.albumNameLabel.text = albumViewModel.albums[indexPath.row].title
        let date = formatDate(albumViewModel.albums[indexPath.row].releaseDate!)
        if let date = date {
            cell.albumReleaseLabel.text = "Release Date: \(date)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedImage = albumViewModel.albums[indexPath.row].cover
        let selectedId = albumViewModel.albums[indexPath.row].id
        let albumTitle = albumViewModel.albums[indexPath.row].title
        performSegue(withIdentifier: Constants.tracksSegue, sender: (selectedId, albumTitle, selectedImage))
    }
    
    
}


extension ArtistAlbumViewController {
    func formatDate(_ dateString: String) -> String? {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = formatter.date(from: dateString) else { return nil }
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd-MMM-yyyy"
        
        return dateFormatterPrint.string(from: date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.tracksSegue {
            if let data = sender as? (Int, String, String) {
                let destinationVC = segue.destination as! TracksViewController
                destinationVC.albumTitle = data.1
                destinationVC.albumId = data.0
                destinationVC.albumImage = data.2
            }
        }
    }
}
