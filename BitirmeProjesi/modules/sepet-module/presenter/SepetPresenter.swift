//
//  SepetPresenter.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 15.01.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    var anasayfaInteractor: PresenterToInteractorSepetProtocol?
    var anasayfaView: PresenterToViewSepetProtocol?
    func sepetYukle() {
        anasayfaInteractor?.tumSepetiAl()
    }
    
    func sil(sepet: Sepet) {
        anasayfaInteractor?.sil(sepet: sepet)
    }
    
     
}

extension SepetPresenter : InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetList: Array<Sepet>) {
        anasayfaView?.vieweVeriGonder(sepetList: sepetList)
    }
}
