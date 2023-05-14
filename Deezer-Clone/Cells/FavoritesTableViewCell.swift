//
//  FavoritesTableViewCell.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 14.05.2023.
//

import UIKit

protocol FavoritesTableViewCellDelegate {
    func didUnFavoriteButtonPressed(_ sender: UIButton)
}

class FavoritesTableViewCell: UITableViewCell {
    
    
    var delegate: FavoritesTableViewCellDelegate?

    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var favoriteSongNameLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func favButtonPressed(_ sender: UIButton) {
        delegate?.didUnFavoriteButtonPressed(sender)
    }
    
}
