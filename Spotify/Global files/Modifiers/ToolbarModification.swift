//
//  ToolbarModification.swift
//  Spotify
//
//  Created by Rafael Agayev on 08.08.25.
//

import SwiftUI

struct ToolbarModification: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .italic()
            .bold()
    }
}

extension View{
    func toolbarModification() -> some View{
        self.modifier(ToolbarModification())
    }
}
