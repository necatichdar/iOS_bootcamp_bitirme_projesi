//
//  YemekDetayProtocols.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 15.01.2022.
//

import Foundation

protocol PresenterToInteractorYemekKayitProtocol {
    func yemekEkle(yemek: Yemekler,adet:Int,fiyat:Int)
}

protocol ViewToPresenterYemekKayitProtocol {
    var YemekKayitInteractor:PresenterToInteractorYemekKayitProtocol? {get set}
    
    func ekle(yemek: Yemekler,adet:Int,fiyat:Int)
}

protocol PresenterToRouterYemekKayitProtocol {
    static func createModule(ref:YemekDetayVC)
}
