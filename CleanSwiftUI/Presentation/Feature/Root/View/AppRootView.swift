//
//  AppRootView.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import SwiftUI

struct AppRootView: View {
    @StateObject var session: UserSessionManager
    @EnvironmentObject var router: AppCoordinator
    
    var body: some View {
        Group {
            TabView(selection: $router.selectedTab) {
                Tab(AppCoordinator.Tabs.home.rawValue,
                    systemImage: "house", value: .home) {
                    let vm = DIContainer.shared.makeProductListViewModel()
                    ProductListView(viewModel: vm)
                }
                
                Tab(AppCoordinator.Tabs.search.rawValue, systemImage: "magnifyingglass", value: .search) {
                    
                }
                
                Tab(AppCoordinator.Tabs.checkout.rawValue, systemImage: "cart", value: .checkout) {
                    let viewModel = DIContainer.shared.makeCartSummeryVM()
                    CartSummeryView(viewModel: viewModel)
                }
                
                Tab(AppCoordinator.Tabs.profile.rawValue, systemImage: "person", value: .profile) {
                    
                }
            }
        }
        .environmentObject(session)
    }
}

#Preview {
    AppRootView(session: DIContainer.shared.makeUserSession())
}
