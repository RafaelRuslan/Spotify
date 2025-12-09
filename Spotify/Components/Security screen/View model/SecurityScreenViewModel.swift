//
//  SecurityScreenViewModel.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.12.25.
//

import Foundation


class SecurityScreenViewModel: ObservableObject{
    
    @Published var enableFaceID = false
    
    @Published var timeOut: Int = 1
    
    @Published var blurInAppSwitcher = true
    
    @Published var autoLogout = true
    
    @Published var disableScreenShots = false
    
    @Published var notifyNewDevice = false
    
}
