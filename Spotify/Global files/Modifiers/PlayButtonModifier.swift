//
//  PlayButtonModifier.swift
//  Spotify
//
//  Created by Rafael Agayev on 25.08.25.
//

import SwiftUI

struct PlayButtonModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(width: 25, height: 25)
            .foregroundStyle(.black.opacity(0.9))
            .background{
                Color.purple
                    .mix(with: .mint, by: 0.55, in: .perceptual)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .shadow(radius: 12)
        }
    }
}

extension View{
    func playButtonModify() -> some View{
        self.modifier(PlayButtonModifier())
    }
}
