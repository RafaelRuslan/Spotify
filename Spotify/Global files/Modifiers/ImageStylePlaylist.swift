//
//  ImageStylePlaylist.swift
//  Spotify
//
//  Created by Rafael Agayev on 08.08.25.
//

import Foundation
import SwiftUI

struct ImageStylePlaylist: ViewModifier{
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .clipShape(Circle())
            .padding(6)
     
        
    }
}

extension View{
    func imagePlaylist() -> some View{
        self.modifier(ImageStylePlaylist())
    }
}
