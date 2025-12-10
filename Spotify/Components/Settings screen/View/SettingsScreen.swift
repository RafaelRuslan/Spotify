//
//  SettingsScreen.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.12.25.
//

import SwiftUI

struct SettingsScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel = SettingsScreenViewModel()
    
    @EnvironmentObject private var appearanceVM: AppearanceViewModel
        
    @ViewBuilder
    private func sectionView(_ section: SettingsScreenViewModel.Section) -> some View {
        switch section{
        case .account:
            AccountView()
        case .about:
            AboutView()
        case .appearance:
            AppearanceView()
                .environmentObject(appearanceVM)
        case .audio:
            AudioView()
        case .notifications:
            NotificationsView()
        case .security:
            SecurityView()
        }
    }
    
    var body: some View {
        List{
            Section("Settings"){
                ForEach(SettingsScreenViewModel.Section.allCases) { section in
                    Button{
                        viewModel.selectedSection = section
                    }label: {
                        HStack{
                            Text(section.rawValue)
                                .foregroundStyle(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .toolbarStylish()
                        }
                    }
                }
            }
        }
        .navigationDestination(item: $viewModel.selectedSection) { section in
            sectionView(section)
                .environmentObject(appearanceVM)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .toolbarStylish()
            }
        }
        ToolbarItem(placement: .principal) {
            Text("Settings")
                .font(.system(size: 22, weight: .semibold, design: .rounded))
                .foregroundStyle(.primary)
        }
    }
}

#Preview {
    SettingsScreen()
}
