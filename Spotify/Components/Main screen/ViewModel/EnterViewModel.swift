//
//  EnterViewModel.swift
//  Spotify
//
//  Created by Rafael Agayev on 05.08.25.
//

import SwiftUI
import FirebaseAuth
import Firebase

class EnterViewModel: ObservableObject{
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var showSecondView: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    @Published var showPassword: Bool = false
    
    var isLogin: Bool{
        !username.trimmingCharacters(in: .whitespaces).isEmpty &&
        !password.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var isRegistered: Bool{
        !username.trimmingCharacters(in: .whitespaces).isEmpty &&
        !password.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    func loginUser() {
        Auth.auth().signIn(withEmail: username, password: password){ result, error in
            if let error = error{
                self.alertMessage = error.localizedDescription
                self.showAlert = true
            }else{
                self.showSecondView = true
            }
        }
    }
    
    func registerUser() {
        Auth.auth().createUser(withEmail: username, password: password){ result, error in
            if let error = error{
                self.alertMessage = error.localizedDescription
                self.showAlert = true
            }else{
                self.showSecondView = true
            }
        }
    }
}
