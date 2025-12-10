//
//  ContactModel.swift
//  Spotify
//
//  Created by Rafael Agayev on 05.08.25.
//

import Foundation
import Contacts

struct Contact: Identifiable {
    let id = UUID()
    let givenName: String
    let familyName: String
    let phoneNumber: String
}
