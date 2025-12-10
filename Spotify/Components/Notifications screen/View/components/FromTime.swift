//
//  FromTime.swift
//  Spotify
//
//  Created by Rafael Agayev on 10.12.25.
//

import SwiftUI

struct FromTime: View {
    
    @Binding var fromTime: Date?
    
    @Binding var temporaryFromTime: Date
    
    var selectedDay: Date
    
    @State var showFromTimePicker = false
    
    var hourFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.calendar = .current
        formatter.dateFormat = "HH:mm"
        
        return formatter
    }

    
    
    var body: some View {
        
        Button{
            if let time = fromTime{
                temporaryFromTime = time
            }
            showFromTimePicker = true
        }label: {
            if let date = fromTime{
                Text(hourFormatter.string(from: date))
                    .fontModifier(size: 14, weight: .semibold, foregroundColor: .colorBlack)
                
            }else {
                Text("From time")
                    .fontModifier(size: 14, weight: .semibold, foregroundColor: .colorBlack)
            }
        }
        .sheet(isPresented: $showFromTimePicker) {
            HourMinutePicker(
                temporaryTime: $temporaryFromTime,
                showPicker: $showFromTimePicker,
                time: $fromTime,
                selectedTime: selectedDay
            )
            .presentationDetents([.fraction(0.4)])
            .presentationCornerRadius(22)
        }
    }
}

//#Preview {
//    FromTime()
//}
