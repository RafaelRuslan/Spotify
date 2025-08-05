//
//  PlaylistButtonStyle.swift
//  Spotify
//
//  Created by Rafael Agayev on 08.08.25.
//


import SwiftUI


struct PlaylistButtonStyle: ViewModifier{

    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 20, height: 20)
            .foregroundStyle(.white)
            
    }
}

extension View{
    func playlistButton() -> some View{
        self.modifier(PlaylistButtonStyle())
    }
}
