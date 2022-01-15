//
//  SepetRouter.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 15.01.2022.
//

import Foundation

class SepetRouter : PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetVC) {
        let presenter = SepetPresenter()
        
        //View için yetkilendirme
        ref.sepetPresenterNesnesi = presenter
        
        //Presenter için yetkilendirme
        ref.sepetPresenterNesnesi?.anasayfaInteractor = SepetInteractor()
        ref.sepetPresenterNesnesi?.anasayfaView = ref
        
        //Interactor için yetkilendirme
        ref.sepetPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
    }
}
