//
//  String_Extension.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 12.01.2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/" + self)
    }
    var asUrl1: URL? {
        return URL(string: self)
    }
}
