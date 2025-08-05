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

    var body: some View {
        ZStack{
            vm.songCurrent?.gradient
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 20) {
                CircleView()
                ProgressViewMain()
                PlayPauseView()
            }
            .padding(.bottom, 30)
            .vStackModify()
            .toolbar {
                toolbar
            }
            .onAppear {
                vm.setupAudio()
                vm.fetchBookmarks()
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .principal) {
            Text(" Music Player ")
                .playerModifier()
        }
        
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.white)
            }
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            ButtonBookmark(song: vm.songs[vm.currentIndex])
                .environmentObject(vm)
        }
    }
}

#Preview {
    let context = PersistenceController.preview.container.viewContext
    PlaylistView()
        .environment(\.managedObjectContext, context)
        .environmentObject(AudioPlayerViewModel(modelContext: context))
}
