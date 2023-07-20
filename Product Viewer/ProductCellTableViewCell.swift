//
//  ProductCellTableViewCell.swift
//  Product Viewer
//
//  Created by mariam adly on 19/07/2023.
//

import UIKit

class ProductCellTableViewCell: UITableViewCell {

    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var productTiltle: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        productView.layer.cornerRadius = 20
        productView.layer.masksToBounds = false
        productView.layer.shadowOpacity = 0.30
        productView.layer.shadowRadius = 4.0
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
