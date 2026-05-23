//
//  GetCartEndpoint.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation

struct GetCartEndpoint: APIEndpoint {
    var baseURL: URL { URL(string: "https://api.example.com")! }
    var path: String { "/v1/cart" }
    var headers: [String : String]? { ["Content-Type": "application/json"] }
    var method: HTTPMethod { .get }
    var queryParameters: [String : String]? { nil }
    var body: Data? { nil }
}
