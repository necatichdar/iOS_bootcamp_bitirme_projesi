//
//  AnasayfaInteractor.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 15.01.2022.
//

import Foundation
import Alamofire
import ProgressHUD

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumYemekleriAl() {
        ProgressHUD.show("Yükleniyor...")
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(YemekCevap.self, from: data)
                    
                    var liste = [Yemekler]()
                    
                    if let gelenListe = cevap.yemekler {
                        liste = gelenListe;
                    }
                    
                    self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                    ProgressHUD.showSuccess("Yükleme tamamlandı.")
                    
                }catch{
                    ProgressHUD.showSuccess(error.localizedDescription)
                    print(error.localizedDescription)
                }
            }
        }
    }
     
     
}
