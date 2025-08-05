//
//  TextModifier.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.08.25.
//

import SwiftUI

struct TextModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.title)
            .bold()
            .kerning(4)
    }
}

extension View{
    func textModify() -> some View{
        self.modifier(TextModifier())
    }
}
