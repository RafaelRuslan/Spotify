//
//  playlistModifier.swift
//  Spotify
//
//  Created by Rafael Agayev on 14.08.25.
//

import SwiftUI

struct playlistModifer: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .font(.title)
            .fontWeight(.semibold)
            .frame(width: 180, height: 30)
            .foregroundStyle(LinearGradient(colors: [.red, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
            .background{
                Color.white
                    .mix(with: .green, by: 0.66, in: .device)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.top, 10)
    }
}

extension View{
    func playerModifier() -> some View{
        self.modifier(playlistModifer())
    }
}
