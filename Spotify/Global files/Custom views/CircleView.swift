//
//  CircleView.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.08.25.
//
import SwiftUI
import SwiftData

struct CircleView: View {
    @EnvironmentObject private var vm: AudioPlayerViewModel
    let screenSize = UIScreen.main.bounds.size
    
    var body: some View {
        if let song = vm.songCurrent?.imageSong {
            Image(song)
                .resizable()
                .imagePlaylist()
                .rotationEffect(.degrees(vm.rotation))
                .frame(width: screenSize.width / 1.5, height: screenSize.width / 1.5)
        }
    }
}

