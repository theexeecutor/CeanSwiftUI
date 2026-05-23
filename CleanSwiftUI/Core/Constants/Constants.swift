//
//  Constants.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation


enum AppConstants {
    
    enum API {
        static let baseUrl = "https://api.example.com"
        static let timeoutDuration = 30.0
    }
    
    enum UserDefault {
        static let lastSyncDate = "last_sync_date_key"
    }
    
    enum Alert {
        static let error = "Sorry, we are facing some internal issue"
    }
    
    enum Layout {
        static let standardPadding: CGFloat = 16.0
        static let buttonHeight: CGFloat = 50.0
    }
}
