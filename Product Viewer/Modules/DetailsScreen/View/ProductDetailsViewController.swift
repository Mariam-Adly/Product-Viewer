//
//  ProductDetailsViewController.swift
//  Product Viewer
//
//  Created by mariam adly on 20/07/2023.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var productTitle: UILabel!
    var productDetailsViewModel : ProductDetailsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
     
        productTitle.text = productDetailsViewModel?.product?.name
       
        
    }
    


}
