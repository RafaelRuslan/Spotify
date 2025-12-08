//
//  SearchMusicModifier.swift
//  Spotify
//
//  Created by Rafael Agayev on 28.08.25.
//

import SwiftUI

struct SearchMusicModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .listStyle(.plain)
            .padding(.horizontal)
            .contentShape(Rectangle())
    }
}

extension View{
    func searchMusicStyle() -> some View{
        self.modifier(SearchMusicModifier())
    }
}
