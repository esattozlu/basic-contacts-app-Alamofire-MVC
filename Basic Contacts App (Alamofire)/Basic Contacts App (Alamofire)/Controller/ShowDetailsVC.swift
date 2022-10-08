//
//  ShowDetailsVC.swift
//  Basic Contacts App (Alamofire)
//
//  Created by Hasan Esat Tozlu on 20.09.2022.
//

import UIKit

class ShowDetailsVC: UIViewController {

    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var phoneNumbLabel: UILabel!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contact = contact {
            contactNameLabel.text = contact.kisi_ad
            phoneNumbLabel.text = contact.kisi_tel
        }
    
    }
    



}
