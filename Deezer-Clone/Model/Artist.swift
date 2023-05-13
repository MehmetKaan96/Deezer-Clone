//
//  GenreArtist.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 10.05.2023.
//

import Foundation

struct GenreArtistResponse: Codable {
    let data: [Artist]
}

struct Artist: Codable {
    let id: Int
    let name: String
    let picture: String
    let pictureMedium: String
    let tracklist: String

    enum CodingKeys: String, CodingKey {
        case id, name, picture, tracklist
        case pictureMedium = "picture_medium"
    }
}

