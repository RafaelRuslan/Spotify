//
//  SecondScreenViewModel.swift
//  Spotify
//
//  Created by Rafael Agayev on 07.12.25.
//

import Foundation

class SecondScreenViewModel: ObservableObject{
    
    let name: String = ""
    
//    @Published var navigateToPlaylist = false
//    
//    @Published var navigateToContacts = false
//    
//    @Published var showSettings = false
    
    @Published var route: Route? = nil
    
    enum Route: Hashable{
        case settings, playlist, contacts
    }
}
