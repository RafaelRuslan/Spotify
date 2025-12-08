//
//  PlayPauseView.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.08.25.
//

import SwiftUI
import SwiftData

struct PlayPauseView: View {
    
    @EnvironmentObject private var vm: AudioPlayerViewModel

    var body: some View {
        VStack {
            Text(vm.songCurrent?.name ?? "no name")
                .font(.title2)
                .foregroundStyle(.white)
            
            HStack(spacing: 30) {
                Button {
                    vm.backSong()
                } label: {
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .playlistButton()
                }
                .padding(.leading, 5)
                
                Button {
                    if vm.player == nil {
                        if let song = vm.songCurrent{
                            vm.playSound(song: song)
                        }
                    } else {
                        vm.togglePlayPause()
                    }
                } label: {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        Image(systemName: vm.isPlaying ? "pause.fill" : "play.fill")
                            .resizable()
                            .playButtonModify()
                    }
                }
                .padding()
                
                Button {
                    vm.nextSong()
                } label: {
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .playlistButton()
                }
            }
            .padding()
        }
    }
}


