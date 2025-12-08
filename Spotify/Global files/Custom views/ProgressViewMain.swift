//
//  ProgressViewMain.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.08.25.
//

import SwiftUI

struct ProgressViewMain: View {
    
    @EnvironmentObject private var vm: AudioPlayerViewModel
    
    @State private var draggingProgress: Double = 0.0
    
    @State private var isDragging = false
    
    var body: some View {
        VStack {
            CustomSlider(
                value: Binding(
                    get: { isDragging ? draggingProgress : vm.progress },
                    set: { newValue in
                        draggingProgress = newValue
                    }
                ),
                range: 0...1,
                onEditingChanged: { editing in
                    isDragging = editing
                    if !editing {
                        vm.seek(to: draggingProgress)
                    }
                }
            )
            .frame(height: 10)
            .padding(.horizontal)
            
            HStack {
                Text(vm.currentTime)
                    .foregroundStyle(.white)
                Spacer()
                Text(vm.durationTime)
                    .foregroundStyle(.white)
            }
            .font(.callout)
        }
        .padding(.vertical)
    }
}
