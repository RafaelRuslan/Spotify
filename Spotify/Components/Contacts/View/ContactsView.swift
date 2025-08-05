//
//  ContactsView.swift
//  Spotify
//
//  Created by Rafael Agayev on 05.08.25.
//

import SwiftUI

struct ContactsView: View {
    @StateObject private var vm = ContactViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
            List(vm.contacts){ contact in
                VStack(alignment: .leading) {
                    Text("\(contact.givenName) \(contact.familyName)")
                        .font(.headline)
                    Text(contact.phoneNumber)
                        .textStyle()
                }
                .padding(.vertical, 5)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                toolbar
            }
            .onAppear{
                vm.requestAccess()
            }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text("Contacts")
                .toolbarStylic()
        }
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    ContactsView()
}
