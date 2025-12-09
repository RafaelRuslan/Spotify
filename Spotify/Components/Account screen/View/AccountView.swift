//
//  AccountView.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.12.25.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var vm = AccountViewModel()
    
    @Environment(\.dismiss) private var dismiss
        
    @StateObject private var navPathDec = NavigationPathStore()
    
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    @StateObject private var session = SessionManager()
    
    @State private var showMain = false
    
    var body: some View {
        
        VStack(spacing: 12) {
            AccountViewTextField(
                username: $vm.username,
                email: $vm.email,
                onDone: { vm.saveChanges() },
                hasChanges: Binding(
                    get: { vm.hasChanges},
                    set: {_ in }))
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
        .navigationDestination(isPresented: $showMain) {
            MainView()
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .principal) {
            Text("Account settings")
                .foregroundStyle(.colorBlack)
                .font(.system(size: 22, weight: .semibold, design: .rounded))
        }
        
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.colorBlack)
            }
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            Button{
                session.logout()
                showMain = true
            }label: {
                Image(systemName: "rectangle.portrait.and.arrow.forward")
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .foregroundStyle(.colorRed)
            }
        }
    }
}

//#Preview {
//    AccountView()
//}
