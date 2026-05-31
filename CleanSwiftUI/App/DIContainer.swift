//
//  DIContainer.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Combine
import Foundation


// Note -
/// If you really want a scalable DI. You can use any 3rd party library.
/// Or define register and resolve method make it reusable and efficient.

class DIContainer: ObservableObject {
    private init() { }
    static let shared: DIContainer = DIContainer()
    
    let client: NetworkEngine = APIClient()
    
    func makeAppCoordinator() -> AppCoordinator {
        
        return AppCoordinator()
    }
    
    func makeUserSession() -> UserSessionManager {
        UserSessionManager()
    }
    
    func makeCartRepository() -> CartRepository {
        let remote = CartRemoteDataSourceImpl()
        let coredata = CoreDataStorage()
        let local = CartLocalDataSourceImpl(localDatabase: coredata)
        return CartRepositoryImpl(remoteDataSource: remote, localDataSource: local)
    }
    
    func makeProductListRepository() -> ProductListRepository {
        let remote = MockProductListRemoteDataSource() // ProductListRemoteDataSourceImpl(apiClient: client)
        let coredata = CoreDataStorage()
        let local = ProductListLocalDataSourceImpl(localDB: coredata)
        return ProductListRepositoryImpl(localDataSource: local, remoteDataSource: remote)
    }
    
    func makeGetCartUseCase() -> GetCartUseCase {
        GetCartUseCase(makeCartRepository())
    }
    
    func makeUpdateCartUseCase() -> UpdateCartItemUseCase {
        UpdateCartItemUseCase(repository: makeCartRepository())
    }
    
    func makeCartSummeryVM() -> CartSummeryVM {
        CartSummeryVM(cart: Cart(id: "initial", item: [], timeStamp: Date()), getCartUseCase: makeGetCartUseCase(), updateCartItemUseCase: makeUpdateCartUseCase())
    }
    
    func makeProductListViewModel() -> ProductListVM {
        let usecase = GetProductsUseCase(repository: makeProductListRepository())
        let viewModel = ProductListVM(useCase: usecase, getCartUseCase: makeGetCartUseCase(), updateCartItemUseCase: makeUpdateCartUseCase())
        return viewModel
    }
}


