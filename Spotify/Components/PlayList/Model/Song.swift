//
//  Song.swift
//  Spotify
//
//  Created by Rafael Agayev on 05.08.25.
//

import Foundation

struct Song: Identifiable, Hashable{
    let id: UUID
    let name: String
    let fileName: String
    let imageSong: String
    var isBookmarked: Bool
}
