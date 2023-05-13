//
//  SongTableViewCell.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 11.05.2023.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var albumReleaseLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
