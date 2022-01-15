//
//  YemekDetayRouter.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 15.01.2022.
//

import Foundation

class YemekKayitRouter : PresenterToRouterYemekKayitProtocol {
    static func createModule(ref: YemekDetayVC) {
        ref.yemekKayitPresenterNesnesi = YemekKayitPresenter()
        ref.yemekKayitPresenterNesnesi?.YemekKayitInteractor = YemekKayitInteractor()
    }
}
