//
//  HomeScreen.swift
//  ECommerce
//
//  Created by M1066900 on 08/09/21.
//

import UIKit
import CoreData

class HomeScreen:UIViewController {
    
    var viewModel = {
        ViewModel()
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    var wishListProducts = [ProductItem]()
    var cartListProducts = [ProductItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView(tableView: tableView)
        viewModel.serviceRequestFromCD()
    }

//MARK:- configuring table view
    func configureTableView(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 300
    }
    
//MARK:- Actions
    @IBAction func showWishlistAction(_ sender: UIButton) {
        guard let vcData = storyboard?.instantiateViewController(identifier: "ProductListingViewController") as? ProductListingViewController else {
            return
        }
        wishListProducts=ProductDetailViewController.wishlist
        vcData.productsListCategory = wishListProducts
        print(wishListProducts)
        show(vcData, sender: nil)
    }
    
    @IBAction func showCartListAction(_ sender: UIButton) {
        guard let vcData = storyboard?.instantiateViewController(identifier: "ProductListingViewController") as? ProductListingViewController else {
            return
        }
        cartListProducts=ProductDetailViewController.cartList
        vcData.productsListCategory = cartListProducts
        show(vcData, sender: nil)
    }
    
//MARK:- listing the products of each category closure
    func moveOnProductListing(index:Int) {
        guard let vcData = storyboard?.instantiateViewController(identifier: "ProductListingViewController") as? ProductListingViewController else {
            return
        }
        let data = (Array(viewModel.dictionary.values)[index])
        vcData.productsListCategory = data
        vcData.categories = Array(viewModel.dictionary.keys)[index]!
        show(vcData, sender: nil)
    }

//MARK:- listing the product detail of each collection view cell
    func moveOnCollectionProductListing(tableIndex:Int, collectionIndex:Int) {
        guard let vcData = storyboard?.instantiateViewController(identifier: "ProductDetailViewController") as? ProductDetailViewController else {
            return
        }
        vcData.productDetail = (Array(viewModel.dictionary.values)[tableIndex])[collectionIndex]
        show(vcData, sender: nil)
    }
}


//MARK:- extension of table view delegate and data source
extension HomeScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dictionary.count
    }
    
//MARK:- on click on see all and collection view cell and displaying details in each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as? ProductsTableViewCell else
        {
            return UITableViewCell()
        }
        cell.categories = "\(String(describing: Array(viewModel.dictionary.keys)[indexPath.row]!))"
        cell.productsListCategory = Array(viewModel.dictionary.values)[indexPath.row]
        cell.index = indexPath.row
        cell.onClickSeeAllClosure = { [self] index in
            if let indexCheck = index{
                moveOnProductListing(index: indexCheck)
            }
        }
        cell.onClickCollectionItemClosure = { tableIndex, collectionIndex in
            if let tableIndex = tableIndex, let collectionIndex = collectionIndex{
                self.moveOnCollectionProductListing(tableIndex: tableIndex, collectionIndex: collectionIndex)
            }
        }
        return cell
    }
}



//let data = Array(viewModel.dictionary.keys)[indexPath]!
//let dataValues = (Array(viewModel.productsItem)[indexPath.row])
//cell.productsInEachCategoryCount = dataValues.c
//cell.productsListCategory = (Array(viewModel.dictionary.values)[indexPath])
