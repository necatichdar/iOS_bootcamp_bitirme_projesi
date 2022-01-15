//
//  PopulerCVC.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 13.01.2022.
//

import UIKit

class PopulerCVC: UICollectionViewCell {
    
    @IBOutlet weak var imageViewYemek: UIImageView!
    
    @IBOutlet weak var labelYemekAdi: UILabel!
    @IBOutlet weak var labelFiyat: UILabel!
    
    func setup(yemek: Yemekler){
        imageViewYemek.kf.setImage(with: yemek.yemek_resim_adi?.asUrl)
        labelFiyat.text = "\(yemek.yemek_fiyat!)₺"
        labelYemekAdi.text = yemek.yemek_adi
        imageViewYemek.layer.cornerRadius = 10.0
        imageViewYemek.clipsToBounds = true
    }
}
