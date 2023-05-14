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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.trackCellName, for: indexPath) as! TracksTableViewCell
        
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
        let convertedSecond = Float(second)
        
        let minute = convertedSecond / Float(60)
        return String(format: "%.2f", minute)
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
