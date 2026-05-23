//
//  APIClient.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation


final class APIClient: NetworkEngine {
    var session: URLSession
    private var inFlightTask: [URL: URLSessionTask] = [:]
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T>(endpoint: any APIEndpoint) async throws -> T where T : Decodable {
        let request = urlRequestBuilder(endpoint)
        // check InflightTask
        //        let task = session.data(for: T##URLRequest)
        let value = try JSONDecoder().decode(T.self, from: Data())
        
        return value
    }
    
    private func urlRequestBuilder(_ endpoint: APIEndpoint) -> URLRequest {
        
        // build url form endpoint
        return URLRequest(url: URL(string: "")!)
    }
}
