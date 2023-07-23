//
//  ViewController.swift
//  Product Viewer
//
//  Created by mariam adly on 19/07/2023.
//

import UIKit
import SDWebImage
import Alamofire

class ProductsController : UIViewController , UITableViewDelegate,UITableViewDataSource{


    @IBOutlet weak var productsTV: UITableView!
    var productVM : ProductsViewModel?
    var productArr : [Result]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsTV.delegate = self
        productsTV.dataSource = self
        
        productVM = ProductsViewModel()
        
        productsTV.register(UINib(nibName: "ProductCellTableViewCell", bundle: nil), forCellReuseIdentifier: "productCell")
        if CheckNetwork.isConnectedToInternet(){
            productVM?.getProducts()
        }else{
            productVM?.getProductsFromeCoreData()
           
        }
        productVM?.saveToCoreData(product: productArr ?? [Result()])
        productVM?.bindResultToProductsTableViewController = {
            DispatchQueue.main.async {
                self.productArr = self.productVM?.productsResult
                self.productsTV.reloadData()
            }
        }

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if CheckNetwork.isConnectedToInternet(){
            productVM?.getProducts()
        }else{
            productVM?.getProductsFromeCoreData()
           
        }
        DispatchQueue.main.async {
            self.productArr = self.productVM?.productsResult
            self.productsTV.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return productArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductCellTableViewCell
            cell.productImg.sd_setImage(with: URL(string: productArr?[indexPath.row].product?.imageURL ?? ""),placeholderImage: UIImage(named: "product"))
            
            cell.productTiltle.text = productArr?[indexPath.row].product?.name
            cell.productDesc.text = productArr?[indexPath.row].product?.description
            cell.productPrice.text = productArr?[indexPath.row].product?.price
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let productDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsVC") as! ProductDetailsViewController
        
        let controller = ProductDetailsViewModel( product : productArr![indexPath.row].product)
        productDetailsVC.productDetailsViewModel = controller
        self.navigationController?.pushViewController(productDetailsVC, animated: true)

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // 1
        let headerView = UIView()
        // 2
        headerView.backgroundColor = view.backgroundColor
        // 3
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
}

