//
//  ProductListingViewController.swift
//  ECommerce
//
//  Created by M1066900 on 09/09/21.
//

import UIKit

class ProductListingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var productsListCategory = [ProductItem]()
    var categories = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(String(describing: categories))"
        configureTableView(tableView: tableView)
    }

//MARK:- configuring table view
    func configureTableView(tableView:UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        tableView.reloadData()
    }

}

//MARK:- extension on table view delegate and data source
extension ProductListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsListCategory.count
    }

//on each passing the details of each category's that index's product details
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell") as? ProductListTableViewCell else{
            return UITableViewCell()
        }
        cell.setCellListingProducts(productDetail: productsListCategory[indexPath.row])
        return cell
    }

//when selected a cell, passing the productdetail to Product detail VC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vcData = storyboard?.instantiateViewController(identifier: "ProductDetailViewController") as? ProductDetailViewController else {
            return
        }
        vcData.productDetail = productsListCategory[indexPath.row]
        show(vcData, sender: nil)
        
    }
}
