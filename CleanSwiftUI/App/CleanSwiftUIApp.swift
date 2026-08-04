//
//  CleanSwiftUIApp.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import SwiftUI

@main
struct CleanSwiftUIApp: App {
    private let container = DIContainer.shared
    
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate
    // Create Router here so that it can handle deeplink and push notification routing.
    @StateObject var router: AppCoordinator
    @StateObject var userSession: UserSessionManager
    
    init() {
        _router = StateObject(wrappedValue: DIContainer.shared.makeAppCoordinator())
        _userSession = StateObject(wrappedValue: DIContainer.shared.makeUserSession())
    }

    var body: some Scene {
        WindowGroup {
            AppRootView(session: container.makeUserSession())
                .environmentObject(router)
                .environmentObject(container)
                .onOpenURL { url in // handle universal link // app url schema
                    // handleUrl(url, router)
                }
        }
    }
}
