//
//  FilteredSearchMusic.swift
//  Spotify
//
//  Created by Rafael Agayev on 28.08.25.
//

import SwiftUI

struct FilteredSearchMusic: ViewModifier{
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 18))
        
    }
}

extension View{
    func filterMusic() -> some View{
        self.modifier(FilteredSearchMusic())
    }
}
