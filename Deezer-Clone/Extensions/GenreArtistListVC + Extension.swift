//
//  GenreArtistListVC + Extension.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 10.05.2023.
//

import Foundation
import UIKit
import Kingfisher

extension GenreArtistListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artistViewModel.artists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.artistCell, for: indexPath) as! GenreArtistCollectionViewCell
        
        let image = URL(string: artistViewModel.artists[indexPath.row].picture)
        
        cell.artistImageView.kf.setImage(with: image)
        cell.artistLabel.text = artistViewModel.artists[indexPath.row].name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedArtistId = artistViewModel.artists[indexPath.row].id
        let artistTitle = artistViewModel.artists[indexPath.row].name
        let image = URL(string: artistViewModel.artists[indexPath.row].picture)
        performSegue(withIdentifier: Constants.artistListSegueIdentifier, sender: (selectedArtistId, artistTitle, image))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthPerItem = view.frame.width / 2.15
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
}


extension GenreArtistListViewController {
    func getGenreArtists(by id: Int) {
        artistViewModel.fetchGenreArtist(by: id) { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.artistCollectionView.reloadData()
            }
            
        }
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (artistCollectionView.frame.width - 30) / 3, height: 200)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        artistCollectionView.collectionViewLayout = layout
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.artistListSegueIdentifier {
            if let data = sender as? (Int, String, URL?){
                let destinationVC = segue.destination as? ArtistAlbumViewController
                destinationVC?.artistId = data.0
                destinationVC?.text = data.1
                destinationVC?.artistImageURL = data.2
            }
        }
    }
}
