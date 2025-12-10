//
//  CircleView.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.08.25.
//
import SwiftUI
import SwiftData

struct CircleView: View {
        
    let songCurrent: String?
    
    @Binding var rotation: Double
    
    let screenSize = UIScreen.main.bounds.size
    
    var body: some View {
        
        if let song = songCurrent{
            Image(song)
                .resizable()
                .imagePlaylist()
                .rotationEffect(.degrees(rotation))
                .frame(width: screenSize.width / 1.5, height: screenSize.width / 1.5)
        }
    }
}

