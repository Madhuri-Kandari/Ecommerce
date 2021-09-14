//
//  ProductListTableViewCell.swift
//  ECommerce
//
//  Created by M1066900 on 09/09/21.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

//MARK:- Outlets for cell
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productRatings: UILabel!
    
    @IBOutlet weak var wishListButtonOutlet: UIButton!
    @IBOutlet weak var cartButtonOutlet: UIButton!
    
    var productDetail:ProductItem?
    var cartButtonAdded:Bool = false
    var wishListAddded:Bool = false
    var tableIndex:Int?
    
    var wishlistProducts = [ProductItem]()
    var cartlistProducts = [ProductItem]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//MARK:- Actions and target for actions
    @IBAction func cartButtonAction(_ sender: UIButton) {
        cartButtonAdded.toggle()
        cartButtonOutlet.addTarget(self, action: #selector(functionCartList), for: .touchUpInside)
    }
    
    @objc func functionCartList() {
        if cartButtonAdded == true {
            cartButtonOutlet.setImage(UIImage(named: "shoppingFull"), for: .normal)
            Toast.show(message: "Added in your Cart", controller: self)
            productDetail?.cartAdded = cartButtonAdded
            ProductDetailViewController.cartList.append(productDetail!)
        }
        else{
            cartButtonOutlet.setImage(UIImage(named: "shoppingcart"), for: .normal)
        }
    }
    
    @IBAction func wishListAction(_ sender: UIButton) {
        wishListAddded.toggle()
        wishListButtonOutlet.addTarget(self, action: #selector(functionWishList), for: .touchUpInside)
    }

    @objc func functionWishList() {
        if wishListAddded == true {
            wishListButtonOutlet.setImage(UIImage(named: "bookmarkFill"), for: .normal)
            Toast.show(message: "Added to your Wishlist", controller: self)
            productDetail?.wishlistAdded = wishListAddded
            ProductDetailViewController.wishlist.append(productDetail!)
        }else {
            wishListButtonOutlet.setImage(UIImage(named: "bookmark"), for: .normal)
        }
    }

//MARK:- passing the data of one product to one detailed cell
    func setCellDetailProduct(productDetail:ProductItem) {
        productName.text = "Name: \(String(describing: productDetail.prodName!))"
        productImage.image = UIImage(named: "\(String(describing: productDetail.prodImage!) )")
        productPrice.text = "Price: \(String(describing: productDetail.prodPrice!))"
        productDescription.text = "Product Detail: \(String(describing: productDetail.prodDescription!))"
        productRatings.text = " Bad Ratings: \(String(describing: productDetail.prodRatings))"
        if productDetail.prodRatings > 3.0 {
            productRatings.font = .boldSystemFont(ofSize: 20)
            productRatings.text = " Good Ratings: \(String(describing: productDetail.prodRatings))"
        }
        productName.font = .boldSystemFont(ofSize: 30)
        if productDetail.wishlistAdded == true {
            wishListButtonOutlet.setImage(UIImage(named: "bookmarkFill"), for: .normal)
        }
        if productDetail.cartAdded == true {
            cartButtonOutlet.setImage(UIImage(named: "shoppingFull"), for: .normal)
        }
        layer.cornerRadius = 15
        layer.borderWidth = 4
        layer.borderColor = CGColor(red: 1, green: 0.3, blue: 0.8, alpha: 1)
    }
    
//MARK:- passing the products details and listing them
    func setCellListingProducts(productDetail:ProductItem) {
        productName.text = "Name: \(String(describing: productDetail.prodName!))"
        productPrice.text = "Price: \(String(describing: productDetail.prodPrice!))"
        productDescription.text = "Brand: \(String(describing: productDetail.prodBrand!))"
        productImage.image = UIImage(named: "\(String(describing: productDetail.prodImage!))")
                layer.cornerRadius = 25
                layer.borderWidth = 3
                layer.borderColor = CGColor(red: 1, green: 0.3, blue: 0.8, alpha: 1)
    }
}


