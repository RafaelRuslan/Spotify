//
//  ToTime.swift
//  Spotify
//
//  Created by Rafael Agayev on 10.12.25.
//

import SwiftUI

struct ToTime: View {
    
    @Binding var toTime: Date?
    
    @Binding var temporaryToTime: Date
    
    var selectedDay: Date
    
    @State var showToTimePicker = false
    
    var hourFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.calendar = .current
        formatter.dateFormat = "HH:mm"
        
        return formatter
    }

    
    
    var body: some View {
        
        Button{
            if let time = toTime{
                temporaryToTime = time
            }
            showToTimePicker = true
        }label: {
            if let date = toTime{
                Text(hourFormatter.string(from: date))
                    .fontModifier(size: 14, weight: .semibold, foregroundColor: .colorBlack)
                
            }else {
                Text("To time")
                    .fontModifier(size: 14, weight: .semibold, foregroundColor: .colorBlack)
            }
        }
        .sheet(isPresented: $showToTimePicker) {
            HourMinutePicker(
                temporaryTime: $temporaryToTime,
                showPicker: $showToTimePicker,
                time: $toTime,
                selectedTime: selectedDay
            )
            .presentationDetents([.fraction(0.4)])
            .presentationCornerRadius(22)
        }
    }
}


//#Preview {
//    ToTime()
//}
