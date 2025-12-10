//
//  NotificationsView.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.12.25.
//

import SwiftUI

struct NotificationsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var vm = NotificationViewModel()
    
    @State private var selectedDay: Date = Date()
    var body: some View {
        ScrollView{
            CardView {
                VStack(alignment: .leading, spacing: 8){
                    Text("Notification types")
                        .font(.headline)
                    
                    Toggle("New Releases", isOn: $vm.newRelease)
                        .font(.subheadline)
                        .onChange(of: vm.newRelease) { isOn in
                            if isOn{
                                vm.requestNotificationPermission()
                                vm.scheduleMusicNotification(title: "New Release", body: "New music updated")
                            }
                        }
                    
                    Toggle("Recommend Music", isOn: $vm.recommendMusic)
                        .font(.subheadline)
                        .onChange(of: vm.recommendMusic) { isOn in
                            if isOn{
                                vm.requestNotificationPermission()
                                vm.scheduleMusicNotification(title: "Enter app and like it your music", body: "Recommend music")
                            }
                        }
                    
                    Toggle("Artist Updates", isOn: $vm.artistUpdates)
                    
                    Toggle("Playlist Activity", isOn: $vm.playlistActivity)
                }
            }
            
            CardView {
                VStack(alignment: .leading, spacing: 8){
                    Text("Alert Preferences")
                        .font(.headline)
                    
                    Toggle("Play Sound", isOn: $vm.soundEnabled)
                    
                    Toggle("Sound Vibration", isOn: $vm.vibrationEnabled)
                }
            }
            
            CardView {
                VStack(alignment: .leading, spacing: 12){
                    Text("Quiest Hours")
                        .font(.headline)
                    
                    HStack(spacing: 20){
                        FromTime(
                            fromTime: $vm.fromTime,
                            temporaryFromTime: $vm.temporaryFromTime,
                            selectedDay: selectedDay,
                            showFromTimePicker: vm.showFromTimePicker
                        )
                        .font(.system(size: 12, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .inputModifier()
                       
                        
                        ToTime(
                            toTime: $vm.toTime,
                            temporaryToTime: $vm.temporaryToTime,
                            selectedDay: selectedDay,
                            showToTimePicker: vm.showToTimePicker
                        )
                        .font(.system(size: 12, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .inputModifier()
                    }
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
            Text("Notification Center")
                .font(.headline)
            
        }
        
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .toolbarStylish()
            }
        }
    }
}

//#Preview {
//    NotificationsView()
//}
