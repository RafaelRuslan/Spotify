//
//  CardView.swift
//  Spotify
//
//  Created by Rafael Agayev on 10.12.25.
//

import SwiftUI

struct CardView<Content: View>: View {
    
    let content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12, content: content)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 3)
    }
}

//#Preview {
//    CardView()
//}
