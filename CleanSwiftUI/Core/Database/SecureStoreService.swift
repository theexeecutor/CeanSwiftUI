//
//  SecureStoreService.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation


protocol SecureStoreService {
    func value(for key: String) async -> String
    func save(value: String, key: String) async
}
