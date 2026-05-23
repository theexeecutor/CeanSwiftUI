//
//  AppCoordinator.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import SwiftUI
import Combine


class AppCoordinator: ObservableObject {
    enum Tabs: String, Identifiable, Hashable {
        var id: Tabs {
            return self
        }
        
        case home = "Home"
        case search = "Search"
        case profile = "Profile"
        case checkout = "Checkout"
    }
    
    enum SceneRoute: Hashable {
        case productList
        case productDetails(id: String)
        case cartSummery
        case checkout(cart: Cart)
        case payment(order: PendingOrder)
    }
    
    enum SheetRoute: Hashable {
        case settings
        case payment
        // ...
    }
    
    @Published var path: NavigationPath = NavigationPath()
    @Published var selectedTab: Tabs = .home
    // use active path if multiple path is there
    
    func push(_ route: SceneRoute) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    // Handle deep link routing
    func handleDeepLinkRoute(_ path: String) {
        
    }
}
