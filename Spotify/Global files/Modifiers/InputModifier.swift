//
//  InputModifier.swift
//  Spotify
//
//  Created by Rafael Agayev on 10.12.25.
//

import SwiftUI

struct InputModifier: ViewModifier {
    
    let padding: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(.all,15)
            .frame(height: 45)
            .roundedRectangleStyle(cornerRadius: 10, backgroundColor: .colorWhite,borderColor: .borderGray, borderWidth: 1.5)
    }
}

extension View {
    
    func inputModifier(padding: CGFloat = 12) -> some View {
        modifier(InputModifier(padding: padding))
    }
    
}
