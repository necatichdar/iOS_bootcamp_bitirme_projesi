//
//  YemekDetayVC.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 12.01.2022.
//

import UIKit
import Kingfisher

class YemekDetayVC: UIViewController {
    
    @IBOutlet weak var imageViewResim: UIImageView!
    @IBOutlet weak var labelBaslik: UILabel!
    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var labelStepper: UIStepper!
    @IBOutlet weak var labelAdet: UILabel!
    @IBOutlet weak var buttonSepeteEkle: UIButton!
    
    var yemek:Yemekler?
    
    var yemekKayitPresenterNesnesi:ViewToPresenterYemekKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YemekKayitRouter.createModule(ref: self)
        if let y = yemek {
            labelBaslik.text = y.yemek_adi
            labelFiyat.text = "\(String(describing: y.yemek_fiyat!))₺"
            imageViewResim.kf.setImage(with: y.yemek_resim_adi?.asUrl)
        }
        labelStepper.value = 1.0
        labelAdet.text = "1"
        buttonSepeteEkle.setTitle("\(fiyatHesapla()) SEPETE EKLE", for: .normal)
    }
    
    func fiyatHesapla() -> String {
        if labelStepper.value == 0.0 {
            return ""
        }
        if let y = yemek {
            let sonuc = Double(y.yemek_fiyat!)! * Double(labelAdet.text!)!
            return "\(sonuc)"
        }
        return ""//String(Double(labelAdet.text!)! * Double(yemek!.yemekFiyat)!)
    }
    
    @IBAction func steppetDegisimKontrol(_ sender: UIStepper) {
        if Int(sender.value) < 1 {
            return
        }
        labelAdet.text = "\(Int(sender.value))"
        buttonSepeteEkle.setTitle("\(fiyatHesapla())₺ SEPETE EKLE", for: .normal)
    }
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let adet = labelAdet.text {
            
            let fiyat = fiyatHesapla()
            let myInt = (fiyat as NSString).integerValue

            yemekKayitPresenterNesnesi?.ekle(yemek: yemek!, adet:  Int(adet)! , fiyat: myInt )
        }
    }
    
}
