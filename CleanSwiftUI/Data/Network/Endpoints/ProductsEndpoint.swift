//
//  ProductsEndpoint.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation

enum ProductsEndpoint: APIEndpoint {
    case filterList(criteria: ProductFilterCriteria)
    
    var baseURL: URL { URL(string: AppConstants.API.baseUrl)! }
    
    var path: String { "products" }
    
    var method: HTTPMethod { .get }
    
    var headers: [String : String]? { [:] }
    
    var queryParameters: [String : String]? {
        switch self {
        case .filterList(criteria: let criteria):
            return [
                "regon": criteria.region,
                "trending": "\(criteria.isTrending)"
            ]
        }
    }
    
    var body: Data? { nil }
}
