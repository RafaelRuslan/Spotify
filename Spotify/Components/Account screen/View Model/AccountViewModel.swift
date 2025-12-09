//
//  AccountViewModel.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.12.25.
//

import Foundation
import SwiftUI


class AccountViewModel: ObservableObject{
    
    @Published var username: String = ""
    
    @Published var email: String = ""
    
    @Published var showChangePassword: Bool = false
    
    @AppStorage("username") private var storedUsername: String = ""
    
    @AppStorage("email") private var storedEmail: String = ""
        
    var hasChanges: Bool{
        !email.isEmpty && !username.isEmpty
    }
    
    func saveChanges(){
        storedUsername = username
        storedEmail = email
    }
    
    init(){
        self.username = storedUsername
        self.email = storedEmail
    }
}
