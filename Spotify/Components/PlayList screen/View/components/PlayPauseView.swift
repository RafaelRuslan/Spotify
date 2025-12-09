//
//  PlayPauseView.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.08.25.
//

import SwiftUI
import SwiftData

struct PlayPauseView: View {
    
    let songCurrent: String?
    
    @Binding var isPlaying: Bool
    
    var onNextSong: () -> Void
    
    var onBackSong: () -> Void
    
    var togglePlayPause: () -> Void

    var body: some View {
        VStack {
            Text(songCurrent ?? "no name")
                .font(.title2)
                .foregroundStyle(.white)
            
            HStack(spacing: 30) {
                Button {
                    onBackSong()
                } label: {
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .playlistButton()
                }
                .padding(.leading, 5)
                
                Button {
                   
                        togglePlayPause()
                } label: {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .resizable()
                            .playButtonModify()
                    }
                }
                .padding()
                
                Button {
                    onNextSong()
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


