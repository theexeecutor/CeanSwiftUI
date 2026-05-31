//
//  ProductListView.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 30/05/26.
//

import SwiftUI

struct ProductListView: View {
    @State var viewModel: ProductListVM
    
    init(viewModel: ProductListVM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            List($viewModel.products, id: \.id) { product in
                VStack {
                    HStack {
                        Text("Title: ")
                        Text(product.title.wrappedValue)
                    }
                    HStack {
                        Text("Description: ")
                        Text(product.description.wrappedValue)
                    }
                    HStack {
                        Text("Price: ")
                        Text(product.price.wrappedValue.formatted())
                        Spacer()
                        Text("Discount: ")
                        Text(product.discount.wrappedValue.formatted())
                    }
                    
                    HStack {
                        Group {
                            Button {
                                
                            } label: {
                                Image(systemName: "minus.circle.fill")
                            }
                            
                            Text("")
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "plus.circle.fill")
                            }
                        }
                        .foregroundStyle(.blue)
                        .font(.title)
                        .padding()
                    }
                }
                .buttonStyle(.plain)
            }
            
        }
        .task {
            viewModel.fetchProducts()
        }
    }
}

#Preview {
    ProductListView(viewModel: DIContainer.shared.makeProductListViewModel())
}
