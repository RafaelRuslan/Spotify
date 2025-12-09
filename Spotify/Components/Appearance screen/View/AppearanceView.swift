//
//  AppearanceView.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.12.25.
//

import SwiftUI

struct AppearanceView: View {
    
    @EnvironmentObject private var vm: AppearanceViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form{
            Section("Theme"){
                Picker("Theme", selection: $vm.selectedTheme) {
                    ForEach(AppearanceViewModel.Theme.allCases) { theme in
                        Text(theme.rawValue.capitalized).tag(theme)
                    }
                }
            }
            Section("Accent color"){
                ColorPicker("Select color", selection: $vm.accentColor)
            }
            Section("Font size"){
                Slider(value: $vm.fontScale, in: 0.8...1.4){
                    Text("Font scale")
                }
            }
            Section("Layout"){
                Toggle("Rounded cards", isOn: $vm.useRoundedCards)
                Picker("Background style", selection: $vm.backgroundStyle) {
                    ForEach(AppearanceViewModel.BackgroundStyle.allCases) { style in
                        Text(style.rawValue).tag(style)
                    }
                }
            }
            Section("Accessbility"){
                Toggle("Reduce motion", isOn: $vm.reduceMotion)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .principal) {
            Text("Appearance")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
        }
        
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.colorBlack)
            }
        }
    }
}

#Preview {
    AppearanceView()
}
