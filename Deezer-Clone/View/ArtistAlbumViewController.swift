//
//  ArtistViewController.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 10.05.2023.
//

import UIKit
import Kingfisher

class ArtistAlbumViewController: UIViewController {
    
    var artistId: Int?
    var text: String?
    var artistImageURL: URL?
    var albumId: Int = 0
    let albumViewModel = ArtistAlbumViewModel()
    var albumImage = [String]()

    @IBOutlet weak var albumTableView: UITableView!
    @IBOutlet weak var artistImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        albumTableView.delegate = self
        albumTableView.dataSource = self
        albumTableView.register(UINib(nibName: "AlbumTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.albumCell)
        
        if let id = artistId, let detailTitle = text, let url = artistImageURL {
            artistImageView.kf.setImage(with: url)
            title = detailTitle
            albumViewModel.fetchAlbumsByArtistId(id) {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.albumTableView.reloadData()
                }
            }
        }
        // Do any additional setup after loading the view.
        
    }
    

}
