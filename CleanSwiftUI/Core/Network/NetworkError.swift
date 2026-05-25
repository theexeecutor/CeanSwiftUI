//
//  NetworkError.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation


enum NetworkError: Equatable {
    case noInternetConnection
    case badRequest(statusCode: Int)
    case decodingFailed(description: String)
    case serverUnreachable
    case unknown(String)
}
