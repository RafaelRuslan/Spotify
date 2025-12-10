//
//  FontModifier 2.swift
//  Spotify
//
//  Created by Rafael Agayev on 10.12.25.
//


import SwiftUI

struct FontModifier : ViewModifier {

    var weight: Font.Weight = .regular
    var size: CGFloat = 12
    var foregroundColor: Color = .white

    func body(content: Content) -> some View {
        content
            .foregroundStyle(foregroundColor)
            .font(.system(size: size, weight: weight))
    }
}

extension View {
    func fontModifier(size: CGFloat, weight: Font.Weight = .regular,foregroundColor: Color = .white) -> some View{
         modifier(
            FontModifier(
                weight: weight,
                size: size,
                foregroundColor: foregroundColor
            )
        )
    }
}