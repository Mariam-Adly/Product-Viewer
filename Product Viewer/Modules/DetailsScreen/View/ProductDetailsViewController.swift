//
//  ProductDetailsViewController.swift
//  Product Viewer
//
//  Created by mariam adly on 20/07/2023.
//

import UIKit
import SDWebImage
class ProductDetailsViewController: UIViewController {
    
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    var productDetailsViewModel : ProductDetailsViewModel?
    
    var landScape : [NSLayoutConstraint]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        
        landScape = [
            productTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 350),
            productTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            productTitle.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            productImg.centerXAnchor.constraint(equalTo: productTitle.centerXAnchor,constant: 400),
            productImg.rightAnchor.constraint(equalTo: productTitle.leftAnchor,constant: 150),
            productImg.centerYAnchor.constraint(equalTo: productTitle.centerYAnchor),
            productImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            
        ]
       
        productTitle.text = productDetailsViewModel?.product?.name
        productImg.sd_setImage(with: URL(string: productDetailsViewModel?.product?.imageURL ?? ""),placeholderImage: UIImage(named: "product"))
        productDesc.text = productDetailsViewModel?.product?.description
        productPrice.text = productDetailsViewModel?.product?.price
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if UIDevice.current.orientation.isLandscape {
            NSLayoutConstraint.activate(landScape!)
        } else {
            NSLayoutConstraint.deactivate(landScape!)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UIDevice.current.orientation.isLandscape {
            NSLayoutConstraint.activate(landScape!)
        } else {
            NSLayoutConstraint.deactivate(landScape!)
            
        }
    }
}
