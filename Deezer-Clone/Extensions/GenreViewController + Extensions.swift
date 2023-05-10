//
//  GenreViewController + Extensions.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 10.05.2023.
//

import Foundation
import UIKit
import Kingfisher

extension GenreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.genreCell, for: indexPath) as! GenreCollectionViewCell
        
        let imageUrl = URL(string: viewModel.genres[indexPath.row].pictureMedium)
        
        cell.genreLabel.text = viewModel.genres[indexPath.row].name
        cell.genreImageView.kf.setImage(with: imageUrl)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthPerItem = view.frame.width / 2.14
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (genreCollectionView.frame.width - 30) / 3, height: 200)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        genreCollectionView.collectionViewLayout = layout
    }
    
}

extension GenreViewController {
    func getGenres() {
        viewModel.fetchGenres {[weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.genreCollectionView.reloadData()
            }
        }
    }
}
