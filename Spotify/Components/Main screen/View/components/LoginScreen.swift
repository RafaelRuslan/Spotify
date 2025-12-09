//
//  LoginScreen.swift
//  Spotify
//
//  Created by Rafael Agayev on 08.12.25.
//

import SwiftUI

struct LoginScreen: View {
    
    @Binding var username: String
    
    @Binding var password: String
    
    @Binding var showPassword: Bool
    
    @Binding var savedUsername: String
    
    var login: () -> Void
    
    @Binding var isLogin: Bool
    
    var onShowPassword: () -> Void
    
    var onRegisterUser: () -> Void
    
    var loginAction: () -> Void
    
    @Binding var isRegistered: Bool
    
//    @Binding var isLoggedIn: Bool
    
    @Binding var showAlert: Bool
    
    @Binding var alertMessage: String

    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black.opacity(0.33), .purple], startPoint: .bottomLeading, endPoint: .center)
                .ignoresSafeArea()
            VStack {
                Text("Welcome to Spotify")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                
                TextField("Enter name...", text: $username)
                    .padding(.horizontal, 12)
                    .frame(height: 48)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.white)
                            .shadow(radius: 0.5)
                    )

                HStack {
                    if showPassword {
                        TextField("Enter password...", text: $password)
                    } else {
                        SecureField("Enter password...", text: $password)
                    }

                    Button {
                        onShowPassword()
                    } label: {
                        Image(systemName: showPassword ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, 12)
                .frame(height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                        .shadow(radius: 0.5)
                )

                HStack(spacing: 10){
                    Button("Login"){
                        withAnimation {
                            login()
                            loginAction()
                            if isLogin {
                               savedUsername = username
                               
                            }
                        }
                    }
                    .buttonStyle()
                    .disabled(!isLogin)
                    .opacity(isLogin ? 1 : 0.5)
                    
                    Button("Register"){
                        withAnimation {
                            onRegisterUser()
                            loginAction()
                            if isRegistered {
                                savedUsername = username
                                
                            }
                        }
                    }
                    .buttonStyle()
                    .disabled(!isRegistered)
                    .opacity(isRegistered ? 1 : 0.5)
                }
            }
            .padding()
            .toolbar {
                toolbar
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
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

//#Preview {
//    LoginScreen()
//}
