//
//  playlistModifier.swift
//  Spotify
//
//  Created by Rafael Agayev on 14.08.25.
//

import Foundation
import SwiftUI

struct playlistModifer: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .foregroundStyle(.white)
            .frame(width: 200, height: 30)
            .background{
                Color.black
                    .opacity(0.44)
                    .shadow(radius: 12)
                    .clipShape(RoundedRectangle(cornerRadius: 35))
            }
            .padding(.top, 10)
    }
}

extension View{
    func playerModifier() -> some View{
        self.modifier(playlistModifer())
    }
}
