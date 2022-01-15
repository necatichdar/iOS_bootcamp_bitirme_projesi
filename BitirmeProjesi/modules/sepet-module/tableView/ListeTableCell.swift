//
//  ListeTableCell.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 15.01.2022.
//

import UIKit

class ListeTableCell: UITableViewCell {

    @IBOutlet weak var imageViewResim: UIImageView!
    
    @IBOutlet weak var labelBaslik: UILabel!
    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var labelTutar: UILabel!
    
    func setup(sepet: Sepet){
        print(sepet)
        imageViewResim.kf.setImage(with: sepet.yemek_resim_adi?.asUrl)
        labelBaslik.text = sepet.yemek_adi
        labelFiyat.text = "\(String(describing: sepet.yemek_siparis_adet!)) Adet"
        labelTutar.text = "\(String(describing: sepet.yemek_fiyat!)) ₺"
    }
}
