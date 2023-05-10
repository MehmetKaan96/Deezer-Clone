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
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case tracklist
        case type
    }
}
