//
//  AppearanceViewModel.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.12.25.
//

import Foundation
import SwiftUI

class AppearanceViewModel: ObservableObject {
    
    @AppStorage("selectedTheme") private var selectedThemeRaw: String = "system"
    @AppStorage("accentRed") private var accentRed: Double = 1.0
    @AppStorage("accentGreen") private var accentGreen: Double = 0.0
    @AppStorage("accentBlue") private var accentBlue: Double = 0.0
    @AppStorage("accentAlpha") private var accentAlpha: Double = 1.0
    @AppStorage("backgroundStyle") private var backgroundStyleRaw: String = "solid"
    
    @AppStorage("reduceMotion") var reduceMotion: Bool = false
    
    @AppStorage("fontScale") var fontScaleStorage: Double = 1.0
    
    @AppStorage("useRoundedCards") var useRoundedCardsStorage: Bool = true
    
    @Published var selectedTheme: Theme = .system
    @Published var accentColor: Color = .red
    @Published var backgroundStyle: BackgroundStyle = .solid
    
    @Published var fontScale: Double = 1.0
    
    @Published var useRoundedCards: Bool = true
    
    init() {
        DispatchQueue.main.async { [self] in
            self.selectedTheme = Theme(rawValue: self.selectedThemeRaw) ?? .system
            self.backgroundStyle = BackgroundStyle(rawValue: self.backgroundStyleRaw) ?? .solid
            self.accentColor = Color(
                red: self.accentRed,
                green: self.accentGreen,
                blue: self.accentBlue,
                opacity: self.accentAlpha
            )
            self.useRoundedCards = useRoundedCardsStorage
            self.fontScale = fontScaleStorage
        }
    }
    
    func saveChanges() {
        selectedThemeRaw = selectedTheme.rawValue
        backgroundStyleRaw = backgroundStyle.rawValue
        
        if let components = UIColor(accentColor).cgColor.components {
            accentRed = Double(components[0])
            accentGreen = Double(components[1])
            accentBlue = Double(components[2])
            accentAlpha = Double(components.count >= 4 ? components[3] : 1)
        }
    }
    
    enum Theme: String, CaseIterable, Identifiable {
        case light, dark, system
        var id: String { rawValue }
    }
    
    enum BackgroundStyle: String, CaseIterable, Identifiable {
        case solid, gradient, blur
        var id: String { rawValue }
    }
}
