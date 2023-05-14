//
//  FavoritesViewController.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 14.05.2023.
//

import UIKit
import RealmSwift

class FavoritesViewController: UIViewController {

    let realm = try! Realm()
    var favorites = [Favourite]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
        favoritesTableView.reloadData()
    }
    
    @IBOutlet weak var favoritesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Beğenilenler"
        
        
        
        favoritesTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "favoritesCell")
        
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }
    

}
