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
        return trackListViewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.albumCell, for: indexPath) as! AlbumTableViewCell
        
        let image = URL(string: trackListViewModel.albums[indexPath.row].cover)
        print(type(of: trackListViewModel.albums[indexPath.row].id))//Int
        cell.albumImageView.kf.setImage(with: image)
        cell.albumNameLabel.text = trackListViewModel.albums[indexPath.row].title
        let date = formatDate(trackListViewModel.albums[indexPath.row].releaseDate!)
        if let date = date {
            cell.albumReleaseLabel.text = "Release Date: \(date)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "", sender: nil)
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
}
