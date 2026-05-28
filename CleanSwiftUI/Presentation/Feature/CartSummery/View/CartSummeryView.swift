//
//  CartSummeryView.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 26/05/26.
//

import SwiftUI


struct CartSummeryView: View {
    @State var viewModel: CartSummeryVM
    
    var body: some View {
        
    }
}


#Preview {
    CartSummeryView(viewModel: CartSummeryVM(cart: Cart(),
                                             getCartUseCase: GetCartUseCase(<#T##repository: any CartRepository##any CartRepository#>),
                                                                            updateCartItemUseCase: <#T##UpdateCartItemUseCase#>))
}
