//
//  MainView.swift
//  Spotify
//
//  Created by Rafael Agayev on 05.08.25.
//

import SwiftUI
import CoreData

struct MainView: View {
        
    @StateObject private var enterVM = EnterViewModel()
    
    @StateObject private var session = SessionManager()
    
    var body: some View {
        NavigationStack {
            if session.isLoggedIn {
                SecondView(name: session.savedUsername)
                    .environmentObject(session)
                    .onTapGesture {
                        session.resetTimer()
                    }
            } else {
                LoginScreen(
                    username: $enterVM.username,
                    password: $enterVM.password,
                    showPassword: $enterVM.showPassword,
                    savedUsername: $session.savedUsername,
                    login: { enterVM.loginUser()},
                    isLogin: Binding(
                        get: { enterVM.isLogin},
                        set: { _ in }),
                    onShowPassword: { enterVM.showPassword.toggle()},
                    onRegisterUser: { enterVM.registerUser()},
                    loginAction: { session.isLoggedIn = true
                        session.startSession(username: session.savedUsername) },
                    isRegistered: Binding(
                        get: { enterVM.isRegistered},
                        set: {_ in }),
                    showAlert: $enterVM.showAlert,
                    alertMessage: $enterVM.alertMessage
                )
                .environmentObject(session)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
