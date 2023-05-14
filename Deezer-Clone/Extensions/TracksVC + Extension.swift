//
//  TracksVC + Extension.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 13.05.2023.
//

import Foundation
import UIKit
import Kingfisher
import AVFoundation

extension TracksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackViewModel.tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: Constants.trackCellName, for: indexPath) as! TracksTableViewCell
        
        cell.delegate = self
        let favorites = Array(realm.objects(Favourite.self))
        favoriteTracks = favorites
        cell.isFavourite = favorites.contains(where: { $0.trackId == trackViewModel.tracks[indexPath.row].id })
        
        let favoriteTrackId = Set(favorites.map({$0.trackId}))
        
        for cell in tableView.visibleCells {
            guard let trackCell = cell as? TracksTableViewCell,
                  let indexPath = tableView.indexPath(for: cell) else {
                continue
            }
            
            let track = trackViewModel.tracks[indexPath.row]
            trackCell.isFavourite = favoriteTrackId.contains(track.id)
        }
        
        if let image = albumImage, let url = URL(string: image) {
            cell.trackImageView.kf.setImage(with: url)
        }
        cell.songNameLabel.text = trackViewModel.tracks[indexPath.row].title
        let duration = changeDurationToMinute(from: trackViewModel.tracks[indexPath.row].duration)
        cell.songDurationLabel.text = "\(duration)''"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let urlString = trackViewModel.tracks[indexPath.row].preview
        print(urlString)
        downloadPreviewSongAndPlay(with: urlString)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

extension TracksViewController {
    func changeDurationToMinute(from second: Int) -> String {
        let seconds = second % 60
        let minutes = (second / 60) % 60
        return String(format: "%d.%02d", minutes, seconds)
    }
    
    func downloadPreviewSongAndPlay(with urlString: String) {
        if let url = URL(string: urlString) {
            do {
                let playerItem = AVPlayerItem(url: url)
                self.player = try AVPlayer(playerItem:playerItem)
                player!.volume = 1.0
                player!.play()
            } catch let error as NSError {
                self.player = nil
                print(error.localizedDescription)
            } catch {
                print("AVAudioPlayer init failed")
            }
        }
    }
    
}

extension TracksViewController: TrackTableViewCellDelegate {
    func didTappedFavouriteButton(_ sender: UIButton) {
        guard let cell = sender.superview?.superview?.superview as? TracksTableViewCell,
              let indexPath = tracksTableView.indexPath(for: cell) else {
            return
        }
        
        let selectedTrack = trackViewModel.tracks[indexPath.row]
        let isFavourite = cell.isFavourite
        
        do {
            try realm.write {
                if !isFavourite {
                    let duration = changeDurationToMinute(from: selectedTrack.duration)
                    
                    // Add to favourites
                    let favouriteTrack = Favourite(trackId: selectedTrack.id, trackName: selectedTrack.title, albumImage: albumImage ?? "", duration: duration)
                    realm.add(favouriteTrack)
                    
                    let alert = UIAlertController(title: "Başarılı", message: "Şarkı favorilerinize eklenmiştir.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Tamam", style: .default))
                    present(alert, animated: true)
                    
                    cell.isFavourite = true
                }
            }
        } catch {
            print("Error modifying favourites: \(error.localizedDescription)")
        }
        
    }
    
    
}
