//
//  MusicViewModel.swift
//  Spotify
//
//  Created by Rafael Agayev on 05.08.25.
//

import Foundation

class MusicViewModel: ObservableObject{
    @Published var model: [MusicModel] = []
    @Published var navigate: Bool = false
    
    init(){
        loadMusic()
    }
    
    func loadMusic(){
        model = [
            MusicModel(artist: "Duman", songName: "Beni Yak"),
            MusicModel(artist: "Adele", songName: "Set fire to the rain"),
            MusicModel(artist: "Adele", songName: "Skyfall"),
            MusicModel(artist: "Eminem", songName: "Mockingbird")
        ]
    }
}
