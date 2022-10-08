//
//  UpdateContactVC.swift
//  Basic Contacts App (Alamofire)
//
//  Created by Hasan Esat Tozlu on 20.09.2022.
//

import UIKit
import Alamofire

class UpdateContactVC: UIViewController {
    
    @IBOutlet weak var contactNameText: UITextField!
    @IBOutlet weak var phoneNumbText: UITextField!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contact = contact {
            contactNameText.text = contact.kisi_ad
            phoneNumbText.text = contact.kisi_tel
        }
        
    }
    
    @IBAction func updateButtonClicked(_ sender: Any) {
        
        if let contact = contact, let name = contactNameText.text, let phone = phoneNumbText.text {
            
            updateContacts(contact_id: contact.kisi_id!, contact_name: name, contact_phone: phone)
            
        }
        navigationController?.popViewController(animated: true)
        
    }
    
    func updateContacts(contact_id: String, contact_name: String, contact_phone: String) {
        NetworkManager.shared.updateContacts(contact_id: contact_id, contact_name: contact_name, contact_phone: contact_phone)
    }

}
