//
//  SecurityView.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.12.25.
//

import SwiftUI

struct SecurityView: View {
    
    @StateObject private var vm = SecurityScreenViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        Form{
            
            Section("App lock"){
                Toggle("Enable Face ID", isOn: $vm.enableFaceID)
                Toggle("Lock app on Close", isOn: $vm.autoLogout)
                
            }
            Section("Privacy"){
                Toggle("Blur in App switcher", isOn: $vm.blurInAppSwitcher)
                Toggle("Disable screenshots", isOn: $vm.disableScreenShots)
            }
            
            Section("Session"){
                Toggle("Auto logout", isOn: $vm.autoLogout)
                
                Picker("Time out", selection: $vm.timeOut) {
                    Text("30 sec")
                        .tag(0)
                    Text("1 min")
                        .tag(1)
                    Text("2 min")
                        .tag(2)
                }
            }
            
            Section("Account"){
                Toggle("Notify new device", isOn: $vm.notifyNewDevice)
                Button("Delete account", role: .destructive){
                    
                }
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
            Text("Security")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundStyle(.colorBlack)
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
    SecurityView()
}
