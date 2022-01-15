//
//  TumUrunlerCVC.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 13.01.2022.
//

import UIKit

class TumUrunlerCVC: UICollectionViewCell {
    @IBOutlet weak var imageViewUrun: UIImageView!
    
    @IBOutlet weak var labelUrunAd: UILabel!
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    func setup(yemek: Yemekler){
        labelUrunAd.text = yemek.yemek_adi
        labelUrunFiyat.text = "\(String(describing: yemek.yemek_fiyat!))₺"
        imageViewUrun.kf.setImage(with: yemek.yemek_resim_adi?.asUrl)
    }
}
