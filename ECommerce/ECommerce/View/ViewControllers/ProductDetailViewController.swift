//
//  ProductDetailViewController.swift
//  ECommerce
//
//  Created by M1066900 on 09/09/21.
//

import UIKit
import CoreData

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var productDetail: ProductItem?
    
    static var wishlist = [ProductItem]()
    static var cartList = [ProductItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = productDetail?.prodName
        configureTableView(tableView: tableView)
    }
    
//MARK:- configuring the table view
    func configureTableView(tableView:UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 715
        tableView.reloadData()
    }
}

//MARK:- extension for table view delegate and data source
extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell") as? ProductListTableViewCell else {
            return UITableViewCell()
        }
        cell.tableIndex = indexPath.row
        cell.productDetail = productDetail
        cell.setCellDetailProduct(productDetail: productDetail!)
        return cell
    }
}

