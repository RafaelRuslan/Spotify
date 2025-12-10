//
//  SettingsScreenViewModel.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.12.25.
//

import Foundation

import Foundation
import SwiftUI

class SettingsScreenViewModel: ObservableObject {
    
    enum Section: String, CaseIterable, Identifiable {
        case account = "Account"
        case audio = "Audio"
        case appearance = "Appearance"
        case security = "Security"
        case notifications = "Notifications"
        case about = "About"
        
        var id: String { rawValue }
    }
    
    @Published var selectedSection: Section?
    
    @Published var showChangePasswordSheet = false
    
    
    @AppStorage("app_theme") var appTheme: String = "system"
    
    
    @Published var faceIDEnabled: Bool = false
    
    @AppStorage("session_timeout") var sessionTimeout: Int = 60
    
    
    var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
    }
}

