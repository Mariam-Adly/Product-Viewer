//
//  Product.swift
//  Product Viewer
//
//  Created by mariam adly on 19/07/2023.
//

import Foundation

class Result: Decodable {
    var product: Product?
    var productMerchants: [ProductMerchantElement]?

    enum CodingKeys: String, CodingKey {
        case product = "Product"
        case productMerchants = "ProductMerchants"
    }
    init(product: Product? = nil, productMerchants: [ProductMerchantElement]? = nil) {
        self.product = product
        self.productMerchants = productMerchants
    }
}

class Product: Decodable {
    var id, name, description, price: String?
    var imageURL: String?
   
    enum CodingKeys: String, CodingKey {
        case id, name, description, price
        case imageURL = "image_url"
    }
    init(id: String? = nil, name: String? = nil, description: String? = nil, price: String? = nil, imageURL: String? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.imageURL = imageURL
    }
}

class ProductMerchantElement: Decodable {
    var merchant: Merchant?
    var merchantProduct: MerchantProduct?
    var productMerchant: ProductMerchantProductMerchant?

    enum CodingKeys: String, CodingKey {
        case merchant = "Merchant"
        case merchantProduct = "MerchantProduct"
        case productMerchant = "ProductMerchant"
    }
}

class Merchant: Decodable {
    var id, name: String?
}

class MerchantProduct: Decodable {
    var id, price, upc, sku: String?
    var buyURL: String?
    var discountPercent: String?
    

    enum CodingKeys: String, CodingKey {
        case id, price, upc, sku
        case buyURL = "buy_url"
        case discountPercent = "discount_percent"
     
    }
}

class ProductMerchantProductMerchant: Decodable {
    var id, productID, upc, sku: String?
    var created, modified, multipleProductsPerPage: String?

    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case upc, sku, created, modified
        case multipleProductsPerPage = "multiple_products_per_page"
    }
}
