//
//  AccountViewTextField.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.12.25.
//

import SwiftUI

struct AccountViewTextField: View {
    
    @Binding var username: String
    
    @Binding var email: String
    
    var onDone: () -> Void
    
    @Binding var hasChanges: Bool
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        TextField("change username", text: $username)
            .padding(10)
            .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
        
        TextField("change e-mail", text: $email)
            .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
                .keyboardType(.emailAddress)
        
        Button{
            onDone()
            dismiss()
           
        }label: {
            Text("Save change")
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(Color.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .disabled(!hasChanges)
        .opacity(hasChanges ? 1 : 0.5)
        
    }
}

//#Preview {
//    accountViewTextField()
//}
