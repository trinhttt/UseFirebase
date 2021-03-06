//
//  ProductCell.swift
//  SaleLayout
//
//  Created by Trinh Thai on 10/12/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var ibCollectionView: UICollectionView!
    
    let arr1 = ["San pham A", "San pham B", "San pham C", "San pham D"]
    let arr2 = ["$100", "$200", "$300", "$500"]
    override func awakeFromNib() {
        super.awakeFromNib()
        ibCollectionView.delegate = self
        ibCollectionView.dataSource = self
        ProductService.instance.getProductList { (success) in
            if success {
                self.ibCollectionView.reloadData()
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ProductCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProductService.instance.productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductItemCell", for: indexPath) as? ProductItemCell {
            cell.ibLabel1.text = ProductService.instance.productList[indexPath.row].name
            cell.ibLabel2.text = ProductService.instance.productList[indexPath.row].price
            return cell

        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: notification, object: nil, userInfo: ["index":"\(indexPath.item)"])
    }
    
}
