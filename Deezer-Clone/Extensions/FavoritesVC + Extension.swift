//
//  FavoritesVC + Extension.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 14.05.2023.
//

import Foundation
import RealmSwift
import Kingfisher

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesCell", for: indexPath) as! FavoritesTableViewCell
        

        cell.delegate = self
        
        if let image = favorites[indexPath.row].albumImage, let url = URL(string: image) {
            cell.favoriteImageView.kf.setImage(with: url)
        }
        
        cell.durationLabel.text = favorites[indexPath.row].duration
        cell.favoriteSongNameLabel.text = favorites[indexPath.row].trackName
        
        return cell
    }
    

}


extension FavoritesViewController {
    func getFavorites() {
        favorites = Array(realm.objects(Favourite.self))
        favoritesTableView.reloadData()
    }
}

extension FavoritesViewController: FavoritesTableViewCellDelegate {
    func didUnFavoriteButtonPressed(_ sender: UIButton) {
        guard let cell = sender.superview?.superview?.superview as? FavoritesTableViewCell,
                  let indexPath = favoritesTableView.indexPath(for: cell) else {
                return
            }
            
            let selectedTrack = favorites[indexPath.row]
            do {
                try realm.write {
                    let favouriteTrack = realm.objects(Favourite.self).filter("trackId == %@", selectedTrack.trackId).first
                    if let favouriteTrack = favouriteTrack {
                        realm.delete(favouriteTrack)
                        
                        let alert = UIAlertController(title: "Başarılı", message: "Şarkı favorilerinizden kaldırılmıştır.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Tamam", style: .default))
                        present(alert, animated: true)
                        
                        favorites.remove(at: indexPath.row)
                        favoritesTableView.reloadData()
                    }
                }
            } catch let error {
                printContent(error.localizedDescription)
            }
    }
        
}

//extension FavoritesViewController: UIScrollViewDelegate {
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if !decelerate {
//            getFavorites()
//        }
//
//    }
//
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//            getFavorites()
//        }
//}
