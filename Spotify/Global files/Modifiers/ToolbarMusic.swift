//
//  ToolbarMusic.swift
//  Spotify
//
//  Created by Rafael Agayev on 28.08.25.
//

import SwiftUI

struct ToolbarMusic: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.black)
            .background(
                Color.white
                    .frame(width: 40, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            )
    }
}

extension View{
    func toolbarStylish() -> some View{
        self.modifier(ToolbarMusic())
    }
}
