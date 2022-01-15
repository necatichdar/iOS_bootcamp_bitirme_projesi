//
//  YemekDetayPresenter.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 15.01.2022.
//

import Foundation

class YemekKayitPresenter : ViewToPresenterYemekKayitProtocol {
    var YemekKayitInteractor: PresenterToInteractorYemekKayitProtocol?
      
    func ekle(yemek: Yemekler, adet: Int, fiyat: Int) {
        YemekKayitInteractor?.yemekEkle(yemek: yemek, adet: adet, fiyat: fiyat)
    }
    
}
