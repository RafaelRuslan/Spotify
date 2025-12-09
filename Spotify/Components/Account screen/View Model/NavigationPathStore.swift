//
//  NavigationPathStore.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.12.25.
//

import Foundation
import SwiftUI

class NavigationPathStore: ObservableObject{
    
    @Published var navPath = NavigationPath()
}
