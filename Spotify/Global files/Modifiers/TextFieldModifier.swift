//
//  TextFieldModifier.swift
//  Spotify
//
//  Created by Rafael Agayev on 07.08.25.
//

import Foundation
import SwiftUI

struct TextFieldModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .padding(.leading, 15)
            .frame(height: 40)
            .accentColor(.purple)
            .opacity(0.9)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .background(Color.gray.opacity(0.22))
            .overlay (
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.blue, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
        
            .padding(.horizontal, 8)
            .padding(.vertical, 10)
            .padding(1)
        
    }
}

extension View{
    func textFieldModifier() -> some View{
        self.modifier(TextFieldModifier())
    }
}
