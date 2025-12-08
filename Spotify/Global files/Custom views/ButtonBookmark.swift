//
//  ButtonBookmark.swift
//  Spotify
//
//  Created by Rafael Agayev on 14.08.25.
//

import SwiftUI

struct ButtonBookmark: View {
    @EnvironmentObject var vm: AudioPlayerViewModel
    var song: Song
    var body: some View {
        Button{
            
            vm.toggleBookmark(for: song)
        }label: {
            Image(systemName: song.isBookmarked ? "heart.fill" : "heart")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundStyle(song.isBookmarked ? .red.mix(with: .purple, by: 0.43) : .black)
                .scaleEffect(song.isBookmarked ? 1.23 : 1)
                .animation(.spring(response: 0.55, dampingFraction: 0.6), value: song.isBookmarked)
        }
    }
}

