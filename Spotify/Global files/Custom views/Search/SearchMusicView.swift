//
//  SearchMusicView.swift
//  Spotify
//
//  Created by Rafael Agayev on 28.08.25.
//

import SwiftUI
import CoreData

struct SearchMusicView: View {
    @EnvironmentObject private var vm: AudioPlayerViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var showPlaylist = false
    
    var body: some View {
                VStack(spacing: 10) {
                    
                    SearchBar(
                        text: $vm.searchMusic,
                        onDone: { vm.searchMusicAsync()})
                    
                    List{
                        ForEach(vm.filteredMusic) { music in
                            HStack{
                                HStack(spacing: 10) {
                                    Image(music.imageSong)
                                        .resizable()
                                        .filterMusic()
                                    Text(music.name)
                                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                                    
                                }
                                .searchMusicStyle()
                                .onTapGesture {
                                    vm.songCurrent = music
                                    vm.playSound(song: music)
                                    dismiss()
                                }
                                Spacer()
                                
                                ButtonBookmark(song: music)
                                    .frame(width: 30, height: 30)
                            }
                        }
                        .listRowSeparator(.hidden)
                        
                    }
                   
                    .padding(.bottom)
                    .onAppear {
                        vm.fetchBookmarks()
                        vm.setupAudio()
                    }
                    .overlay {
                        if !vm.searchMusic.isEmpty && vm.filteredMusic.isEmpty{
                            VStack(spacing: 10){
                                Image(systemName: "music.note.list")
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundStyle(.black)
                                    .font(.system(size: 42, weight: .semibold, design: .rounded))
                                Text("Music not found !")
                                    .font(.system(size: 22, weight: .medium, design: .serif))
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                    .padding(.bottom, 20)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
            }
        }
        
        ToolbarItem(placement: .principal) {
            Text("Search")
                .playerModifier()
        }
    }
}
#Preview {
    let context = PersistenceController.preview.container.viewContext
    SearchMusicView()
        .environment(\.managedObjectContext, context)
        .environmentObject(AudioPlayerViewModel(modelContext: context))
}
