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
    
    @EnvironmentObject private var session: SessionManager
    
    @StateObject private var secondVM = SecondScreenViewModel()
        
    var buttons: some View {
        HStack(alignment: .center, spacing: 30) {
            Button{
                secondVM.route = .playlist
            }label: {
                Image(systemName: "music.note.list")
                    .imageStyle()
            }
            Button{
                secondVM.route = .contacts
            }label: {
                Image(systemName: "phone.connection.fill")
                    .imageStyle()
            }
        }
        .navigationDestination(item: $secondVM.route){ route in
            switch route{
            case .playlist:
                PlaylistView()
                    .environmentObject(vm)
            case .settings:
                SettingsScreen()
            case .contacts:
                ContactsView()
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Text("Hello \(name)")
                .textModify()
        }
        .onTapGesture {
            session.resetTimer()
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

        ToolbarItem(placement: .topBarTrailing) {
                Button {
                    secondVM.route = .settings
                } label: {
                    Image(.settingsIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)

            }
            .padding(.top, 10)
        }
    }

}

