//
//  TracksViewController.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 13.05.2023.
//

import UIKit
import AVFoundation
import RealmSwift

class TracksViewController: UIViewController {
    
    let realm = try! Realm()
    let trackViewModel = TrackViewModel()
    var albumId: Int?
    var albumTitle: String?
    var albumImage: String?
    var player: AVPlayer!
    var cell: TracksTableViewCell!
    var favoriteTracks: [Favourite] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tracksTableView.reloadData()
    }
    
    @IBOutlet weak var tracksTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tracksTableView.register(UINib(nibName: "TracksTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.trackCellName)
        tracksTableView.delegate = self
        tracksTableView.dataSource = self
        
        if let id = albumId, let albumTitle = albumTitle {
            title = albumTitle
            trackViewModel.fetchTracksById(id) {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.tracksTableView.reloadData()
                }
            }
        }
        
    }
    

}
