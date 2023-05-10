//
//  Genre.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 10.05.2023.
//

import Foundation

struct Genre: Codable {
    let id: Int
    let name: String
    let picture: String
    let pictureSmall: String
    let pictureMedium: String
    let pictureBig: String
    let pictureXl: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
    }
}

struct GenreResponse: Codable {
    let data: [Genre]
}
