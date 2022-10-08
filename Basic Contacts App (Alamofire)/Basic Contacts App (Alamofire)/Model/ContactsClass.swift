//
//  ContactsClass.swift
//  Basic Contacts App (Alamofire)
//
//  Created by Hasan Esat Tozlu on 28.09.2022.
//

import Foundation

class Contact: Codable {
    var kisi_id: String?
    var kisi_ad: String?
    var kisi_tel: String?
    
    init() {
        
    }
    
    init(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_tel = kisi_tel
    }
}
