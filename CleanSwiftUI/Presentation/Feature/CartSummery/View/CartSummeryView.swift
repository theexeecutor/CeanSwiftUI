//
//  CartSummeryView.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 26/05/26.
//

import SwiftUI


struct CartSummeryView: View {
    @State var viewModel: CartSummeryVM
    @EnvironmentObject var container: DIContainer
    
    var body: some View {
        
    }
}


#Preview {
    let repository = DIContainer.shared.makeCartRepository()
    CartSummeryView(viewModel: CartSummeryVM(cart: Cart(id: "Dummy", item: [], timeStamp: Date()),
                                             getCartUseCase: GetCartUseCase(repository),
                                             updateCartItemUseCase: UpdateCartItemUseCase(repository: repository)))
}
