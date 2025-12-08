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
            .font(.headline)
            .frame(width: 150)
            .foregroundStyle(.white)
            .background(
                Color.blue
                    .frame(height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(maxWidth: .infinity)
                    .blur(radius: 0.58)
            )
            .shadow(radius: 30)
    }
}

extension View{
    func buttonStyle() -> some View{
        self.modifier(ButtonModifier())
    }
}
