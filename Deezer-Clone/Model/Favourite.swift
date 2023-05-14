//
//  Favourite.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 14.05.2023.
//

import Foundation
import RealmSwift

class Favourite: Object {
    @objc dynamic var trackId: Int = 0
    @objc dynamic var trackName: String = ""
    @objc dynamic var albumImage: String? = nil
    @objc dynamic var duration: String? = nil
    
    convenience init(trackId: Int, trackName: String, albumImage: String?, duration: String) {
        self.init()
        self.trackId = trackId
        self.trackName = trackName
        self.albumImage = albumImage
        self.duration = duration
    }
}
