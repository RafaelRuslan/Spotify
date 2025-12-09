//
//  SessionManager.swift
//  Spotify
//
//  Created by Rafael Agayev on 08.12.25.
//

import Foundation
import SwiftUI

class SessionManager: ObservableObject {

    @AppStorage("isLoggedIn") var isLoggedIn = false
    @AppStorage("savedUsername") var savedUsername = ""
    
    

    private var logoutTimer: Timer?

    func startSession(username: String) {
        savedUsername = username
        isLoggedIn = true
        resetTimer()
    }

    func logout() {
        isLoggedIn = false
        savedUsername = ""
        logoutTimer?.invalidate()
    }
    
    func resetTimer() {
        logoutTimer?.invalidate()
        logoutTimer = Timer.scheduledTimer(withTimeInterval: 60, repeats: false) { _ in
            self.logout()
        }
    }
}

