//
//  ViewController.swift
//  Basic Contacts App (Alamofire)
//
//  Created by Hasan Esat Tozlu on 20.09.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var contactsTableView: UITableView!
    
    var contactsList = [Contact]()
    var isSearching = false
    var searchingText: String?
    var searchedContactsList: [Contact]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        DispatchQueue.main.async {
            if self.isSearching {
                self.searchContacts(contact_name: self.searchingText!)
            } else {
                self.getAllContacts()
            }
            self.contactsTableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index = sender as? Int
        
        if segue.identifier == "toDetails" {
            let destinationVC = segue.destination as! ShowDetailsVC
            destinationVC.contact = contactsList[index!]
        }
        
        if segue.identifier == "toUpdateContact" {
            let destinationVC = segue.destination as! UpdateContactVC
            destinationVC.contact = contactsList[index!]
        }
        
    }
    
    func getAllContacts() {
        
        NetworkManager.shared.getAllContact { contacts in
            if let contacts = contacts {
                self.contactsList = contacts
            } else {
                self.contactsList.removeAll()
            }
            
            self.contactsTableView.reloadData()
        }
    }
    
    func searchContacts(contact_name: String) {
        
        NetworkManager.shared.searchContacts(contact_name: contact_name) { contacts in
            if let searchedContacts = contacts {
                self.contactsList = searchedContacts
                self.contactsTableView.reloadData()
            } else {
                self.contactsList.removeAll()
                self.contactsTableView.reloadData()
            }
        }

    }
    
    func deleteContacts(contact_id: String) {
        
        NetworkManager.shared.deleteContacts(contact_id: contact_id) { success in
            if success {
                if self.isSearching {
                    self.searchContacts(contact_name: self.searchingText!)
                } else {
                    self.getAllContacts()
                }
                
                self.contactsTableView.reloadData()
            }
        }
    }
}


