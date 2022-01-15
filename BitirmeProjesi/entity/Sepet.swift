//
//  Sepet.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 15.01.2022.
//

import Foundation

struct Sepet: Codable {
    var sepet_yemek_id, yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet,kullanici_adi: String?
}


var sepetler:[Sepet] = [
    Sepet(sepet_yemek_id: "2", yemek_adi: "Ayran", yemek_resim_adi: "izgaratavuk.png", yemek_fiyat: "23", yemek_siparis_adet: "21", kullanici_adi: "necatichdar"),
    Sepet(sepet_yemek_id: "2", yemek_adi: "Ayran", yemek_resim_adi: "ayran.png", yemek_fiyat: "23", yemek_siparis_adet: "21", kullanici_adi: "necatichdar"),
    Sepet(sepet_yemek_id: "2", yemek_adi: "Ayran", yemek_resim_adi: "izgaratavuk.png", yemek_fiyat: "23", yemek_siparis_adet: "21", kullanici_adi: "necatichdar"),
    Sepet(sepet_yemek_id: "2", yemek_adi: "Ayran", yemek_resim_adi: "ayran.png", yemek_fiyat: "23", yemek_siparis_adet: "21", kullanici_adi: "necatichdar"),
    Sepet(sepet_yemek_id: "2", yemek_adi: "Ayran", yemek_resim_adi: "izgaratavuk.png", yemek_fiyat: "23", yemek_siparis_adet: "21", kullanici_adi: "necatichdar"),
     
]

