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
        ProductsCoreData.coreData.insertProduct(productItem: product)
    }
    
    func getProductsFromeCoreData(){
        ProductsCoreData.coreData.fetchProducts()
    }
    
    func  getProductsCount()->Int{
      return productsResult?.count ?? 0
    }
    
    func getProductsAtIndex(index:Int)-> Product{
      return productsResult?[index].product ?? Product()
    }
    
}
