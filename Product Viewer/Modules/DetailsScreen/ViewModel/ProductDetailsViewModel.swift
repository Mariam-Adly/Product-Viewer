//
//  ProductDetailsViewModel.swift
//  Product Viewer
//
//  Created by mariam adly on 20/07/2023.
//

import Foundation
class ProductDetailsViewModel{
    
    var product : Product?
    var productDetailsViewModel : ProductDetailsViewModel?
    init(product: Product? = nil, productDetailsViewModel: ProductDetailsViewModel? = nil) {
        self.product = product
        self.productDetailsViewModel = productDetailsViewModel
    }
}
