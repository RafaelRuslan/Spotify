//
//  PlaylistView.swift
//  Spotify
//
//  Created by Rafael Agayev on 05.08.25.
//

import SwiftUI
import CoreData

struct PlaylistView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var vm : AudioPlayerViewModel
    @State private var showSearchMusicView = false
    @State private var showFocusView = false

    var body: some View {
        ZStack{
            vm.songCurrent?.gradient
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 20) {
                CircleView(songCurrent: vm.songCurrent?.imageSong, rotation: $vm.rotation)
                ProgressViewMain(
                    progress: $vm.progress,
                    currentTime: $vm.currentTime,
                    durationTime: $vm.durationTime,
                    seek: { progress in
                        vm.seek(to: progress)
                    })
                PlayPauseView(
                    songCurrent: vm.songCurrent?.name,
                    isPlaying: $vm.isPlaying,
                    onNextSong: {
                        vm.nextSong()
                    },
                    onBackSong: {
                        vm.backSong()
                    },
                    togglePlayPause: {
                        vm.togglePlayPause()
                    }
                )
            }
            
            .vStackModify()
            .toolbar {
                toolbar
            }
            
            .onAppear {
                vm.setupAudio()
                vm.fetchBookmarks()
            }
        }
        .navigationDestination(isPresented: $showSearchMusicView) {
            SearchMusicView()
                .environmentObject(vm)
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .principal) {
            Text(" Music Player ")
                .foregroundStyle(.colorBlack)
                
        }
        
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .toolbarStylish()
            }
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            ButtonBookmark(song: vm.songs[vm.currentIndex], toggleBookmark: { songs in vm.toggleBookmark(for: songs)})
                .environmentObject(vm)
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            Button{
                showSearchMusicView = true
            }label: {
                Image(systemName: "waveform.badge.magnifyingglass")
                    .toolbarStylish()
            }
        }
    }
}

#Preview {
    let context = PersistenceController.preview.container.viewContext
    PlaylistView()
        .environment(\.managedObjectContext, context)
        .environmentObject(AudioPlayerViewModel(modelContext: context))
}
