//
//  Artist.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 10.05.2023.
//

import Foundation

struct GenreArtistResponse: Codable {
    var response: [Artist]
}

struct Artist: Codable {
    let id: Int
    let name: String
    let picture: String
    let pictureSmall: String
    let pictureMedium: String
    let pictureBig: String
    let pictureXl: String
    let tracklist: String
    let type: String
}
