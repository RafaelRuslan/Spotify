//
//  MusicModel.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.08.25.
//

import Foundation

struct MusicModel: Identifiable, Codable{
    var id = UUID()
    let artist: String
    let songName: String
}
