//
//  YemekDetayInteractor.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 15.01.2022.
//

import Foundation
import Alamofire
import ProgressHUD

class YemekKayitInteractor : PresenterToInteractorYemekKayitProtocol {
    
    func yemekEkle(yemek: Yemekler,adet:Int,fiyat:Int) {
        ProgressHUD.show("Ürün ekleniyor...")
        let username  = d.string(forKey: "username")
        print("1")
        
        var liste = [Sepet]()
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: ["kullanici_adi":username!]).response { response in
            if let data = response.data {
                do{
                    print("2")
                    let cevap = try JSONDecoder().decode(SepetCevap.self, from: data)
                    print("3222")
                    if let gelenListe = cevap.sepet_yemekler {
                        liste = gelenListe;
                    }
                    var yemek_fiyat = Int(fiyat)
                    var yemek_siparis_adet = Int(adet)
                    var urun_id = 0
                    print("2.3")
                    //listeyi dönüyor
                    //Eğer sepet listesinde ürün varsa var olan ürünün fiyatı ve adeti değişecek eklenecek var olan silinecek.
                    if !liste.isEmpty{
                        for urun  in liste {
                            if urun.yemek_adi == yemek.yemek_adi{
                                print("zaten urun var")
                                urun_id = Int(urun.sepet_yemek_id!)!
                                yemek_fiyat = Int(urun.yemek_fiyat!)! + Int(exactly: fiyat)!
                                yemek_siparis_adet = Int(urun.yemek_siparis_adet!)! + Int(exactly: adet)!
                                print("yeni fiyat = \(yemek_fiyat) ve adet \(yemek_siparis_adet)")
                            }
                        }
                    }
                    
                    print("2.4")
                        print("3")
                    let params:Parameters = [
                        "yemek_adi":String(yemek.yemek_adi!),
                        "yemek_resim_adi":String(yemek.yemek_resim_adi!),
                        "yemek_fiyat" : Int(yemek_fiyat),
                        "yemek_siparis_adet" : Int(yemek_siparis_adet),
                        "kullanici_adi" : username!
                    ]
                    print("4")
                    
                    AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post
                               ,parameters: params
                    )
                        .response { response in
                            
                            if let data = response.data {
                                do{
                                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                                        print(json)
                                    }
                                    ProgressHUD.showSuccess("Ürün başarıyla eklendi. 👨🏼‍🍳")
                                }catch{
                                    print(error.localizedDescription)
                                    ProgressHUD.showError(error.localizedDescription)
                                }
                            }
                        }
                    
                        print("5")
                    let params1:Parameters = ["sepet_yemek_id":urun_id,"kullanici_adi": username!]
                    
                    AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params1).response { response in
                       
                        if let data = response.data {
                            do{
                                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                                    print(json)
                                     
                                }
                            }catch{
                                print(error.localizedDescription)
                                ProgressHUD.showError(error.localizedDescription)
                            }
                        }
                    }
                    
                        print("6")
                }catch{
                    print(error.localizedDescription)
                        print("7")
                    let params:Parameters = [
                        "yemek_adi":String(yemek.yemek_adi!),
                        "yemek_resim_adi":String(yemek.yemek_resim_adi!),
                        "yemek_fiyat" : Int(fiyat),
                        "yemek_siparis_adet" : Int(adet),
                        "kullanici_adi" : username!
                    ]
                    print("4")
                    
                    AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post
                               ,parameters: params
                    )
                        .response { response in
                            
                            if let data = response.data {
                                do{
                                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                                        print(json)
                                    }
                                    ProgressHUD.showSuccess("Ürün başarıyla eklendi. 👨🏼‍🍳")
                                }catch{
                                    print(error.localizedDescription)
                                    ProgressHUD.showError(error.localizedDescription)
                                }
                            }
                        }
                }
            }
        }
        
        
    }
}

