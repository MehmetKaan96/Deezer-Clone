//
//  Album.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 13.05.2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let albumResponse = try? JSONDecoder().decode(AlbumResponse.self, from: jsonData)

import Foundation

// MARK: - AlbumResponse
struct AlbumResponse: Codable {
    let data: [Album]
}

struct Album: Codable {
    let id: Int
    let title: String
    let link: String
    let cover: String
    let coverSmall: String
    let coverMedium: String
    let coverBig: String
    let coverXl: String
    let genre_id: Int?
    let fans: Int?
    let releaseDate: String?
    let recordType: String?
    let tracklist: String
    let explicitLyrics: Bool
    let type: String

    enum CodingKeys: String, CodingKey {
        case id, title, link, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case genre_id
        case fans
        case releaseDate = "release_date"
        case recordType = "record_type"
        case tracklist
        case explicitLyrics = "explicit_lyrics"
        case type
    }
}


