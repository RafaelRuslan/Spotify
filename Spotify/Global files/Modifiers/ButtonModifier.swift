//
//  ButtonModifier.swift
//  Spotify
//
//  Created by Rafael Agayev on 07.08.25.
//

import Foundation
import SwiftUI

struct ButtonModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 200)
            .foregroundStyle(.blue)
            .background(Color.mint)
            .opacity(.greatestFiniteMagnitude)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension View{
    func buttonStyle() -> some View{
        self.modifier(ButtonModifier())
    }
}
