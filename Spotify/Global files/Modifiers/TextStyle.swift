//
//  TextStyle.swift
//  Spotify
//
//  Created by Rafael Agayev on 08.08.25.
//

import SwiftUI

struct TextStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundStyle(.gray)
    }
}

extension View{
    func textStyle() -> some View{
        self.modifier(TextStyle())
    }
}
