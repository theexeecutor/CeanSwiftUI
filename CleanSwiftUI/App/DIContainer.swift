//
//  DIContainer.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation


// Note -
/// If you really want a scalable DI. You can use any 3rd party library.
/// Or define register and resolve method make it reusable and efficient.

class DIContainer {
    private init() { }
    static let shared: DIContainer = DIContainer()
    
    func makeAppCoordinator() -> AppCoordinator {
        
        return AppCoordinator()
    }
    
    func makeUserSession() -> UserSessionManager {
        UserSessionManager()
    }
    
    
}


