//
//  ProductListVM.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 30/05/26.
//

import SwiftUI
import CoreData


@Observable
class ProductListVM {
    var products: [Product]
    var itemCounts: [String: Int] = [:]
    @ObservationIgnored
    private let getProductsUseCase: GetProductsUseCase
    private let getCartUseCase: GetCartUseCase
    private let updateCartItemUseCase: UpdateCartItemUseCase
    
    init(products: [Product] = [],
         useCase: GetProductsUseCase,
         getCartUseCase: GetCartUseCase,
         updateCartItemUseCase: UpdateCartItemUseCase) {
        self.products = products
        self.getProductsUseCase = useCase
        self.getCartUseCase = getCartUseCase
        self.updateCartItemUseCase = updateCartItemUseCase
    }
    
    func fetchProducts() {
        Task {
            do {
                let products = try await getProductsUseCase.repository.fetchProducts(criteria: ProductFilterCriteria(region: "in", isTrending: true))
                self.products = products
            } catch {
                // Handle error
            }
        }
    }
    
    func fetchCart() {
        Task {
            let stream = getCartUseCase.execute()
            
            for try await cart in stream {
                self.itemCounts = Dictionary(uniqueKeysWithValues: cart.items.map { ($0.id, $0.count) })
            }
        }
    }
    
    func update(product: Product, isAdded: Bool) {
        if isAdded {
            itemCounts[product.id, default: 0] += 1
        } else {
            itemCounts[product.id, default: 0] -= 1
        }
        
        if itemCounts[product.id]! == 0 {
            itemCounts[product.id] = nil
        }
        
        let cartItem = CartItem(id: product.id, product: product, count: itemCounts[product.id] ?? 0)
        Task {
            do {
                let _ = try await updateCartItemUseCase.execute(cartItem)
            } catch {
                print(error)
            }
        }
    }
}
