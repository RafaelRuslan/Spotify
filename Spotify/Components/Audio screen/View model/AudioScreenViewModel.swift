//
//  AudioScreenViewModel.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.12.25.
//

import Foundation

class AudioScreenViewModel: ObservableObject{
    
    @Published var autoPlayNext: Bool = true
    
    @Published var playbackSpeed: Double = 1.0
    
    @Published var notifyTrackChange: Bool = true
    
    @Published var notifyPlaylistUpdate: Bool = false
}
