//
//  ProductsCoreData.swift
//  Product Viewer
//
//  Created by mariam adly on 21/07/2023.
//

import Foundation
import CoreData
import UIKit
class ProductsCoreData{
    
    var context : NSManagedObjectContext?
    let appDelegate : AppDelegate?
    static var coreData = ProductsCoreData()
    let entity: NSEntityDescription?
    
     private init(){
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate?.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "Item", in: context!)
    }
    
    func insertProduct(productItem : [Result]){
        
        let product = NSManagedObject(entity: entity!, insertInto: context)
    
        product.setValue(productItem[0].product?.name, forKey: "name")
        product.setValue(productItem[0].product?.description, forKey: "desc")
        product.setValue(productItem[0].product?.price, forKey: "price")
        //product.setValue(ProductItem[0].product?.imageURL, forKey: "image")
        do{
            try context?.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
    }
    
    func fetchProducts()->[Result]?{
        var productArr = [Result]()

        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Item")
        do{
            let products = try self.context?.fetch(fetchReq)

            for product in products!{
               
                let product = Product(name: product.value(forKey: "name") as? String,description: product.value(forKey: "description") as? String,price: product.value(forKey: "price") as? String)
                let result = Result(product: product,productMerchants: [ProductMerchantElement()])
                productArr.append(result)

            }
          }catch let error as NSError{
              print(error.localizedDescription)
        }
        return productArr
    }
    
}
