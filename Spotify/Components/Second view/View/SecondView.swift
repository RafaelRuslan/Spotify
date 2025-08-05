//
//  SecondView.swift
//  Spotify
//
//  Created by Rafael Agayev on 05.08.25.
//

import SwiftUI
import CoreData

struct SecondView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var modelContext
    @EnvironmentObject private var vm : AudioPlayerViewModel
    let name: String
    @State private var navigateToPlaylist = false
    @State private var navigateToContacts = false
    
    var buttons: some View {
        HStack(alignment: .center, spacing: 30) {
            Button{
                navigateToPlaylist = true
            }label: {
                Image(systemName: "music.note.list")
                    .imageStyle()
            }
            Button{
                navigateToContacts = true
            }label: {
                Image(systemName: "phone.connection.fill")
                    .imageStyle()
            }
        }
        .navigationDestination(isPresented: $navigateToPlaylist){
            PlaylistView()
        .environmentObject(vm)
        }
        .sheet(isPresented: $navigateToContacts) {
            ContactsView()
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Text("Hello \(name)")
                .textModify()
        }
        
        .padding()
        
        buttons
        .toolbar {
            toolbar
        }
        .navigationBarBackButtonHidden()
        
    }
        @ToolbarContentBuilder
        private var toolbar: some ToolbarContent {
            ToolbarItem(placement: .principal) {
                Text("Play ModeOn")
                    .playerModifier()
            }
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                }
        }
    }
}

#Preview {
        let context = PersistenceController.preview.container.viewContext
        let vm = AudioPlayerViewModel(modelContext: context)
        NavigationStack {
            SecondView(name: "")
                .environment(\.managedObjectContext, context)
                .environmentObject(vm)
    }
}
