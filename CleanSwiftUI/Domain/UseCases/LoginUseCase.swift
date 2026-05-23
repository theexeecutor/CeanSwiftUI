//
//  LoginUseCase.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation

// 1. Protocol Definition

protocol LoginUseCase {
    func execute(credentials: LoginCredential) async throws -> User
}

struct LoginUseCaseImpl: LoginUseCase {
    func execute(credentials: LoginCredential) async throws -> User {
        
    }
}
