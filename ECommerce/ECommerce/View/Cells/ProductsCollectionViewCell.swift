//
//  ProductsCollectionViewCell.swift
//  ECommerce
//
//  Created by M1066900 on 09/09/21.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    var productDetail: ProductItem?
    
}
