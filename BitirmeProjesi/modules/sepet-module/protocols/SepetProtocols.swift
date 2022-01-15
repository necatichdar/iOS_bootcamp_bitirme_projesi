//
//  SepetProtocols.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 15.01.2022.
//

import Foundation


//Ana protocol
protocol PresenterToInteractorSepetProtocol {
    var anasayfaPresenter:InteractorToPresenterSepetProtocol? {get set}
    
    func tumSepetiAl()
    func sil(sepet:Sepet)
}

//Ana protocol
protocol ViewToPresenterSepetProtocol {
    var anasayfaInteractor:PresenterToInteractorSepetProtocol? {get set}
    var anasayfaView:PresenterToViewSepetProtocol? {get set}
    
    func sepetYukle()
    func sil(sepet:Sepet)
}

//Taşıyıcı protocol
protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetList:Array<Sepet>)
}

//Taşıyıcı Protocol
protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetList:Array<Sepet>)
}

//Router protocol
protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetVC)
}
