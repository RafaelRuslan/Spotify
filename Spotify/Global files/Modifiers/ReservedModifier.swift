//
//  ReservedModifier.swift
//  Spotify
//
//  Created by Rafael Agayev on 30.08.25.
//

import SwiftUI

struct ReservedModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .bold()
            .foregroundStyle(.blue)
    }
}


extension View{
    func reservedModify() -> some View{
        self.modifier(ReservedModifier())
    }
}
