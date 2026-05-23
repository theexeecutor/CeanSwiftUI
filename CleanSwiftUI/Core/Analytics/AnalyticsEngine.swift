//
//  AnalyticsEngine.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation

protocol AnalyticsEngine {
    func sendEvent(events: [String: String]) async
}
