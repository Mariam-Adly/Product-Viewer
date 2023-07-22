//
//  ProductsViewModel.swift
//  Product Viewer
//
//  Created by mariam adly on 19/07/2023.
//

import Foundation
class ProductsViewModel{
    var bindResultToProductsTableViewController : (()->()) = {}
    var productsResult : [Result]?{
        didSet{
            bindResultToProductsTableViewController()
        }
    }

    func getProducts(){
        NetworkServices.getProducts(){
            [weak self](result) in
            self?.productsResult = result
        }
    }
    
    func saveToCoreData(product : [Result]){
        ProductsCoreData.coreData.insertProduct(ProductItem: productsResult ?? [Result()])
        print(productsResult)
    }
    
    func getProductsFromeCoreData(){
        self.productsResult = ProductsCoreData.coreData.fetchProducts()
        print("jessy\(productsResult?[0].product?.name)")
    }
    
    
}
