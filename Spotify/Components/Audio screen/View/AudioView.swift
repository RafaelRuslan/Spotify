//
//  AudioView.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.12.25.
//

import SwiftUI

struct AudioView: View {
    
    @StateObject private var vm = AudioScreenViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        Form{
            Section("Playback"){
                Toggle("Auto play next", isOn: $vm.autoPlayNext)
                VStack(alignment: .leading) {
                    Text("Playback Speed: \(String(format: "%.2fx", vm.playbackSpeed))")
                    
                    Slider(value: $vm.playbackSpeed, in: 0.5...2, step: 0.25)
                }
            }
            Section("Notifications"){
                Toggle("Track change alert", isOn: $vm.notifyTrackChange)
                
                Toggle("Playlist update alerts", isOn: $vm.notifyPlaylistUpdate)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
        
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .principal) {
            Text("Audio Settings")
                .foregroundStyle(.colorBlack)
                .font(.system(.title3, design: .rounded, weight: .semibold))
        }
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .toolbarStylish()
            }
        }
    }
}

#Preview {
    AudioView()
}
