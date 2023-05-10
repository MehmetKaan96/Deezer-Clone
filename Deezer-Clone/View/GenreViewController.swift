//
//  GenreViewController.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 10.05.2023.
//

import UIKit

class GenreViewController: UIViewController {
    
    @IBOutlet weak var genreCollectionView: UICollectionView!
    let viewModel = GenreViewModel()
    var itemsPerRow: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        setupCollectionView()
        getGenres()
        // Do any additional setup after loading the view.
    }
    
}

