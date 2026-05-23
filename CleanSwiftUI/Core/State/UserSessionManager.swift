//
//  UserSessionManager.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Combine


class UserSessionManager: ObservableObject {
    var activeUser: User?
    var isLoggedIn: Bool = false
    
    init() {
        isLoggedIn = checkForAccessKeyInKeyStore()
    }
    
    
    func logIn(user: User) {
        self.activeUser = user
    }
    
    func logOut() {
        self.activeUser = nil
        self.isLoggedIn = false
    }
    
    func checkForAccessKeyInKeyStore() -> Bool {
        // setup keychain. Do in Infrastructure.
        return false
    }
}
