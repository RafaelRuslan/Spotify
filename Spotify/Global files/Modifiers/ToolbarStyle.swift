//
//  ToolbarStyle.swift
//  Spotify
//
//  Created by Rafael Agayev on 08.08.25.
//

import SwiftUI

struct ToolbarStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.title)
            .bold()
            .italic()
    }
}

extension View{
    func toolbarStylic() -> some View{
        self.modifier(ToolbarStyle())
    }
}
