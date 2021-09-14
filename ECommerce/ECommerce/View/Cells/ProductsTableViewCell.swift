//
//  ProductsTableViewCell.swift
//  ECommerce
//
//  Created by M1066900 on 09/09/21.
//

import UIKit

//MARK:-closure declaring for passing the index when clicked on seeAll button, and collectionViewCell
typealias SeeAllClosure = ((_ index: Int?)->Void)
typealias DidSelectCollectionItemClosure = ((_ tableIndex: Int?, _ collectionIndex: Int?)->Void)

class ProductsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var categoryName: UILabel!
    
    var productsListCategory = [ProductItem]()
    
    var index: Int?
    var onClickSeeAllClosure: SeeAllClosure?
    var onClickCollectionItemClosure: DidSelectCollectionItemClosure?
    
    var categories: String?{
        didSet{
            categoryName.text = "\(String(describing: categories!))"
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //setting the delegate and data source to collectionView
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
//MARK:- action for seeALL button in home screen
    @IBAction func seeAllButton(_ sender: Any) {
        onClickSeeAllClosure?(index)
    }
}

//MARK:- extension for collectionView's delegate and data source
extension ProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
//MARK:- for each collection view items in each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as? ProductsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.productName.text = "\(String(describing: productsListCategory[indexPath.item].prodName!))"
        cell.productImage.image = UIImage(named: "\(String(describing: productsListCategory[indexPath.item].prodImage!))")
        return cell
    }

//MARK:- when clicked on each item of collection view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onClickCollectionItemClosure?(index, indexPath.item)
    }
    

}
