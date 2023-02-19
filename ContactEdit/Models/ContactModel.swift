//
//  ContactModel.swift
//  ContactEdit
//
//  Created by Esync on 19/02/2023.
//

import Foundation

struct ContactModel: Codable, Identifiable {
    let id: String
    var firstName: String
    var lastName: String
    var email: String?
    var phone: String?
    var dob: String?
}

extension ContactModel: Hashable, Equatable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(firstName)
        hasher.combine(lastName)
        hasher.combine(email)
        hasher.combine(phone)
        hasher.combine(dob)
    }
    
}

