//
//  ImageStyle.swift
//  Spotify
//
//  Created by Rafael Agayev on 05.08.25.
//

import SwiftUI

struct ImageStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .imageScale(.medium)
            .font(.system(size: 30))
            .aspectRatio(contentMode: .fill)
    }
}

extension View{
    func imageStyle() -> some View{
        self.modifier(ImageStyle())
    }
}

