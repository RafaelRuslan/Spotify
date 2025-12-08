//
//  VstackModifier.swift
//  Spotify
//
//  Created by Rafael Agayev on 11.08.25.
//

import SwiftUI

struct VStackModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(.bottom, 30)
            .navigationBarBackButtonHidden()
    }
}

extension View{
    func vStackModify() -> some View{
        self.modifier(VStackModifier())
    }
}
