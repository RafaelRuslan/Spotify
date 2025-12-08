//
//  Song.swift
//  Spotify
//
//  Created by Rafael Agayev on 05.08.25.
//

import Foundation

class Song: Identifiable, ObservableObject {
    let id: UUID
    @Published var name: String
    @Published var fileName: String

    @Published var imageSong: String
    @Published var isBookmarked: Bool
    
    init(id: UUID = UUID(), name: String, fileName: String, imageSong: String, isBookmarked: Bool = false) {
        self.id = id
        self.name = name
        self.fileName = fileName
        self.imageSong = imageSong
       
        self.isBookmarked = isBookmarked
    }
}
