//
//  TracksTableViewCell.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 13.05.2023.
//

import UIKit

protocol TrackTableViewCellDelegate {
    func didTappedFavouriteButton(_ sender: UIButton)
}

class TracksTableViewCell: UITableViewCell {
    
    var delegate: TrackTableViewCellDelegate?
    
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var songDurationLabel: UILabel!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    
    var isFavourite: Bool = false {
        didSet {
            if isFavourite {
                favouriteButton.setImage(UIImage(named: "heart.fill"), for: .normal)
                favouriteButton.tintColor = .systemPink
            } else {
                favouriteButton.setImage(UIImage(named: "heart"), for: .normal)
                favouriteButton.tintColor = .systemBlue
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        delegate?.didTappedFavouriteButton(sender)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
