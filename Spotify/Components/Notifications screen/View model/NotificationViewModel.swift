//
//  NotificationViewModel.swift
//  Spotify
//
//  Created by Rafael Agayev on 10.12.25.
//

import Foundation
import UserNotifications

class NotificationViewModel: ObservableObject{
    
    @Published var newRelease: Bool = false
    
    @Published var artistUpdates: Bool = false
    
    @Published var recommendMusic: Bool = false
    
    @Published var artistActivity: Bool = false
    
    @Published var playlistActivity: Bool = false
    
    @Published var soundEnabled: Bool = false
    
    @Published var vibrationEnabled: Bool = false
      
    @Published var fromTime: Date?
    
    @Published var temporaryFromTime: Date = Date()
    
    @Published var showFromTimePicker: Bool = false
    
    @Published var toTime: Date?
    
    @Published var temporaryToTime: Date = Date()
    
    @Published var showToTimePicker = false
    
    func scheduleMusicNotification(title: String, body: String, timeInterval: TimeInterval = 1) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    print("Notifications allowed")
                } else {
                    print("Notifications denied")
                }
            }
        }
    }
}
