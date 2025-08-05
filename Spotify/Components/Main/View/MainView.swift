//
//  MainView.swift
//  Spotify
//
//  Created by Rafael Agayev on 05.08.25.
//

import SwiftUI
import CoreData

struct MainView: View {
    @State private var text: String = ""
    @State private var showSecondView = false
    @EnvironmentObject private var vm: AudioPlayerViewModel

    var body: some View {
        ZStack{
            LinearGradient(colors: [.accentColor, .white], startPoint: .bottomLeading, endPoint: .center)
                .ignoresSafeArea()
            VStack {
                TextField("Enter name...", text: $text)
                    .textFieldModifier()
                    .padding(1)
                
                Button("SEND"){
                    showSecondView = true
                }
                .buttonStyle()
                .disabled(text.isEmpty)
            }
            .padding()
            .navigationDestination(isPresented: $showSecondView){
                SecondView(name: text)
                    .environmentObject(vm)
                    
            }
            .toolbar {
                toolbar
            }
            .padding()
        }
        .onAppear{
            vm.setupAudio()
        }
    }
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        
        ToolbarItem(placement: .principal) {
            Text("Spotify")
                .playerModifier()
               
        }
    }
}

#Preview {
    let context = PersistenceController.preview.container.viewContext
        MainView()
            .environmentObject(AudioPlayerViewModel(modelContext: context))
}
