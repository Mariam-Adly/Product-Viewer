//
//  ViewController.swift
//  Product Viewer
//
//  Created by mariam adly on 19/07/2023.
//

import UIKit
import SDWebImage
import Alamofire

class ProductsViewController : UIViewController {
    
    
    @IBOutlet weak var productsTV: UITableView!
    var productVM : ProductsViewModel?
    var networkIndecator : UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        productsTV.delegate = self
        productsTV.dataSource = self
        
        productVM = ProductsViewModel()
        
        networkIndecator = UIActivityIndicatorView(style: .large)
        networkIndecator.color = UIColor.black
        networkIndecator.center = view.center
        networkIndecator.startAnimating()
        view.addSubview(networkIndecator)
        
        productsTV.register(UINib(nibName: "ProductCellTableViewCell", bundle: nil), forCellReuseIdentifier: "productCell")
    
        
        if CheckNetwork.isConnectedToInternet(){
            productVM?.getProducts()
        }else{
            productVM?.getProductsFromeCoreData()
    }
        productVM?.bindResultToProductsTableViewController = {
            DispatchQueue.main.async {
                self.productsTV.reloadData()
                self.networkIndecator.stopAnimating()
            }
        }
        
}
    

    override func viewWillAppear(_ animated: Bool) {
        if CheckNetwork.isConnectedToInternet(){
            productVM?.getProducts()
        }else{
            productVM?.getProductsFromeCoreData()
        }
        productVM?.bindResultToProductsTableViewController = {
            DispatchQueue.main.async {
                self.productsTV.reloadData()
                self.networkIndecator.stopAnimating()
            }
        }
    }
}

extension ProductsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let productDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsVC") as! ProductDetailsViewController
        
        let controller = ProductDetailsViewModel( product : productVM?.getProductsAtIndex(index: indexPath.row))
        productDetailsVC.productDetailsViewModel = controller
        self.navigationController?.pushViewController(productDetailsVC, animated: true)

    }
}

extension ProductsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productVM?.getProductsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductCellTableViewCell
        let data = productVM?.getProductsAtIndex(index: indexPath.row)
        self.productVM?.saveToCoreData(product: self.productVM?.productsResult ?? [Result()])
            cell.productImg.sd_setImage(with: URL(string: data?.imageURL ?? ""),placeholderImage: UIImage(named: "product"))
        cell.productTiltle.text = data?.name
            cell.productDesc.text = data?.description
            cell.productPrice.text = data?.price
        return cell
    }
    
}
