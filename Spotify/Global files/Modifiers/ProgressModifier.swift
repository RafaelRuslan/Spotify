//
//  ProgressModifier.swift
//  Spotify
//
//  Created by Rafael Agayev on 11.08.25.
//

import SwiftUI

struct ProgressModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .progressViewStyle(.linear)
            .tint(.green)
            .frame(height: 8)
    }
}

extension View{
    func progressModify() -> some View{
        self.modifier(ProgressModifier())
    }
}
