//
//  ToolbarModifier.swift
//  Spotify
//
//  Created by Rafael Agayev on 08.08.25.
//

import SwiftUI

struct ToolbarModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(width: 280)
            .bold()
            .font(.title)
            .foregroundStyle(.white)
            .background(
                Color.black
            )
            .containerShape(.buttonBorder)
    }
}

extension View{
    func toolbarStyle() -> some View{
        self.modifier(ToolbarModifier())
    }
}
