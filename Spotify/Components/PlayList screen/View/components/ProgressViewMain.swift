//
//  ProgressViewMain.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.08.25.
//

import SwiftUI

struct ProgressViewMain: View {
        
    @State private var draggingProgress: Double = 0.0
    
    @State private var isDragging = false
    
    @Binding var progress: Double
    
    @Binding var currentTime: String
    
    @Binding var durationTime: String
    
    var seek: (Double) -> Void
    
    var body: some View {
        VStack {
            CustomSlider(
                value: Binding(
                    get: { isDragging ? draggingProgress : progress },
                    set: { newValue in
                        draggingProgress = newValue
                    }
                ),
                range: 0...1,
                onEditingChanged: { editing in
                    isDragging = editing
                    if !editing {
                        seek(draggingProgress)
                    }
                }
            )
            .frame(height: 10)
            .padding(.horizontal)
            
            HStack {
                Text(currentTime)
                    .foregroundStyle(.colorWhite)
                Spacer()
                Text(durationTime)
                    .foregroundStyle(.colorWhite)
            }
            .font(.callout)
        }
        .padding(.vertical)
    }
}
