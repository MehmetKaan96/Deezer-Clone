//
//  GenreArtistViewController.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 10.05.2023.
//

import UIKit

class GenreArtistListViewController: UIViewController {

    @IBOutlet weak var artistCollectionView: UICollectionView!
    var genreId: Int?
    var titleText: String?
    
    let artistViewModel = ArtistViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        artistCollectionView.delegate = self
        artistCollectionView.dataSource = self
        
        setupCollectionView()
        
        if let text = titleText, let id = genreId {
            title = text
            getGenreArtists(by: id)
        }
    }
    
}
