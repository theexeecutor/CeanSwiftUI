//
//  User.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation

class User: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var role: String
    
    init(id: String, name: String, role: String) {
        self.id = id
        self.name = name
        self.role = role
    }
}
