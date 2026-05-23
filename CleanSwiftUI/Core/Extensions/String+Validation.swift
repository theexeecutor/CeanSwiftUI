//
//  String+Validation.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation

extension String {
    static let emailRegex = /w+/ // check the correct regex for email.
    var isValidEmail: Bool {
        Self.emailRegex.contains(captureNamed: self)
    }
}
