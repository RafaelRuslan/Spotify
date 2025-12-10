//
//  HourMinutePicker.swift
//  Spotify
//
//  Created by Rafael Agayev on 10.12.25.
//

import SwiftUI

struct HourMinutePicker: View {
    
    @Binding var temporaryTime: Date
    
    @Binding var showPicker: Bool
    
    @Binding var time: Date?
    
    @State var selectedTime: Date = Date()
    
    var onDone: () -> Void = {}
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.colorWhite.opacity(0.9))
                        .shadow(radius: 4)
                    
                    DatePicker(
                        "",
                        selection: $temporaryTime,
                        in: selectedTime...,
                        displayedComponents: .hourAndMinute
                    )
                    .datePickerStyle(.wheel)
                    .frame(maxHeight: 180)
                    .padding(.trailing, 12)
                    .clipped()
                }
                .frame(height: 180)
                .padding(.horizontal, 20)
                .padding(.top, 18)
                
                Spacer()
                
                HStack(spacing: 12) {
                    Text("Cancel")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.accent)
                        .roundedRectangleStyle(cornerRadius: 10, backgroundColor: .colorWhite, borderColor: .accent, borderWidth: 2)
                    
                        .onTapGesture {
                            
                            showPicker = false
                            
                        }
                    
                    Text("Done")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .roundedRectangleStyle(cornerRadius: 10, backgroundColor: .accent, borderWidth: 2)
                        .foregroundStyle(.colorWhite)
                        .onTapGesture {
                            time = temporaryTime
                            showPicker = false
                            onDone()
                        }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
        }
    }
}

