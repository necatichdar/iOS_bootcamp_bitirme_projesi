//
//  SepetInteractor.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 15.01.2022.
//

import Foundation
import Alamofire
import ProgressHUD

class SepetInteractor : PresenterToInteractorSepetProtocol {
    var anasayfaPresenter: InteractorToPresenterSepetProtocol?
    
    func tumSepetiAl() {
        let username  = d.string(forKey: "username")
        let params:Parameters = ["kullanici_adi":username!]
        
        ProgressHUD.show("Sepet yükleniyor...")
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(SepetCevap.self, from: data)
                    var liste = [Sepet]()
                    if let gelenListe = cevap.sepet_yemekler {
                        liste = gelenListe;
                    }
                    let sortedList = liste.sorted {
                        $0.yemek_adi! < $1.yemek_adi!
                    }
                    self.anasayfaPresenter?.presenteraVeriGonder(sepetList: sortedList)
                    ProgressHUD.showSuccess("Sepet başarıyla yüklendi. 👨🏼‍🍳")
                }catch{
                    print(error.localizedDescription)
                    let liste = [Sepet]()
                    ProgressHUD.showSuccess("Sepet başarıyla yüklendi. 👨🏼‍🍳")
                    self.anasayfaPresenter?.presenteraVeriGonder(sepetList: liste)
                }
            }
        }
    }
    
    func sil(sepet: Sepet) {
        let username  = d.string(forKey: "username")
        
        let params:Parameters = ["sepet_yemek_id":sepet.sepet_yemek_id!,"kullanici_adi": username!]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).response { response in
           
            if let data = response.data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                        self.tumSepetiAl()
                    }
                }catch{ 
                    self.tumSepetiAl()
                }
            }
        }
    }
}
