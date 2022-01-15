//
//  KategoriListeVC.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 14.01.2022.
//

import UIKit

class KategoriListeVC: UIViewController {

    @IBOutlet weak var imageViewKategori: UIImageView!
    @IBOutlet weak var labelBaslik: UILabel!
    @IBOutlet weak var labelAciklama: UILabel!
    
    var kategori:YemekKategori?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let y = kategori {
            print("geldi mi ")
            labelBaslik.text = y.name
            labelAciklama.text = y.description
            imageViewKategori.kf.setImage(with: y.image.asUrl1)
        }
    }
}
