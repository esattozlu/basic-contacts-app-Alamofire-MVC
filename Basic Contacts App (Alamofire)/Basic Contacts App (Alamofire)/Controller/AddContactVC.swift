//
//  AddContactVC.swift
//  Basic Contacts App (Alamofire)
//
//  Created by Hasan Esat Tozlu on 20.09.2022.
//

import UIKit
import Alamofire

class AddContactVC: UIViewController {
    
    
    @IBOutlet weak var contactNameText: UITextField!
    @IBOutlet weak var phoneNumbText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func addButtonClicked(_ sender: Any) {
        
        if let name = contactNameText.text, let phone = phoneNumbText.text {
        
            addContacts(contact_name: name, contact_phone: phone)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func addContacts(contact_name: String, contact_phone: String) {
        NetworkManager.shared.addContacts(contact_name: contact_name, contact_phone: contact_phone)
    }
    
}
