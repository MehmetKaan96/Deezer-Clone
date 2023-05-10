//
//  GenreArtistViewController.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 10.05.2023.
//

import UIKit

class GenreArtistListViewController: UIViewController {

    var genreId: Int?
    var titleText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let text = titleText {
            title = text
        }
    }
    
}
