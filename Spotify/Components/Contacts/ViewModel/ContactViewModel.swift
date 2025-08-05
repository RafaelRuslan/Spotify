//
//  ContactViewModel.swift
//  Spotify
//
//  Created by Rafael Agayev on 05.08.25.
//

import Foundation
import Contacts

class ContactViewModel: ObservableObject {
    @Published var contacts: [Contact] = []
    
    private let store = CNContactStore()
    
    func requestAccess(){
        store.requestAccess(for: .contacts){ granted, error in
            if granted{
                DispatchQueue.global(qos: .userInitiated).async {
                    self.fetchContacts(using: self.store)
                }
            }else {
                print("Error: \(error?.localizedDescription ?? "unknown")")

            }
        }
    }
    
    private func fetchContacts(using store: CNContactStore){
        let keyToFetch = [
            CNContactGivenNameKey,
            CNContactFamilyNameKey,
            CNContactPhoneNumbersKey
        ] as [CNKeyDescriptor]
        
        let request = CNContactFetchRequest(keysToFetch: keyToFetch)
        
        var fetchedContacts: [Contact] = []
        do{
            try store.enumerateContacts(with: request) { contact, _ in
                let givenName = "\(contact.givenName)"
                let familyName = "\(contact.familyName)"
                let phone = contact.phoneNumbers.first?.value.stringValue ?? "no number"
                let customContact = Contact(givenName: givenName, familyName: familyName, phoneNumber: phone)
                fetchedContacts.append(customContact)
            }
            
            DispatchQueue.main.async {
                self.contacts = fetchedContacts
            }
            
        } catch{
            print("Error: \(error.localizedDescription)")
        }
    }
}
