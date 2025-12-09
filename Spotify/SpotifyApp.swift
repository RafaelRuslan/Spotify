//
//  SpotifyApp.swift
//  Spotify
//
//  Created by Rafael Agayev on 05.08.25.
//

import SwiftUI
import CoreData
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct SpotifyApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var vm = AppearanceViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainView()
                    .environmentObject(AudioPlayerViewModel(modelContext: persistenceController.container.viewContext))
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(vm)
            }
            .preferredColorScheme( vm.selectedTheme == .light ? .light :
                                    vm.selectedTheme == .dark ? .dark : nil)
            .accentColor(vm.accentColor)
            
        }
    }
}
