//
//  AlbumTracks.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 13.05.2023.
//

import Foundation

struct AlbumTracksResponse: Codable {
    let data: [Track]
}

struct Track: Codable {
    let id: Int
    let readable: Bool
    let title: String
    let titleShort: String?
    let titleVersion: String?
    let link: String
    let duration: Int
    let rank: Int?
    let explicitLyrics: Bool
    let explicitContentLyrics: Int
    let explicitContentCover: Int
    let preview: String
//    let artist: Artist
//    let album: Album
    
    enum CodingKeys: String, CodingKey {
        case id, readable, title
        case titleShort = "title_short"
        case titleVersion = "title_version"
        case link, duration, rank
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case preview
//        case artist, album
    }
}

