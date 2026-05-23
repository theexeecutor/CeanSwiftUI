//
//  KeychainDataStore.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation
//import keychainServie


class KeychainDataStore: SecureStoreService {
    // var keychain = Keychain(name: bundle identifier)
    
    func value(for key: String) async -> String {
        
        return ""
    }
    
    func save(value: String, key: String) async {
        
    }
}
