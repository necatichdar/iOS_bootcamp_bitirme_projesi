//
//  CategoryCVC.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 12.01.2022.
//

import UIKit
import Kingfisher

class CategoryCVC: UICollectionViewCell {
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    func setup(category: YemekKategori){
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image.asUrl1)
    }
}
