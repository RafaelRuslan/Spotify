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
    
    @EnvironmentObject private var session: SessionManager
    
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
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
                Button{
                    withAnimation{
                        session.logout()
//                        isLoggedIn = false
                        dismiss()
                    }
                }label: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .font(.system(size: 20, weight: .medium, design: .rounded))
                            .foregroundStyle(LinearGradient(colors: [.red, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                }
                .padding(.top, 10)
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
