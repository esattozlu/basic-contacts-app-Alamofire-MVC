//
//  File.swift
//  Basic Contacts App (Alamofire)
//
//  Created by Hasan Esat Tozlu on 8.10.2022.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contactsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCell
        cell.contactSummaryLabel.text = contact.kisi_ad
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetails", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, boolValue in
            let kisi = self.contactsList[indexPath.row]
            
                self.deleteContacts(contact_id: kisi.kisi_id!)
            
        }
        
        let updateAction = UIContextualAction(style: .normal, title: "Update") { contextualAction, view, boolValue in
            self.performSegue(withIdentifier: "toUpdateContact", sender: indexPath.row)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, updateAction])
        
    }

}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama \(searchText)")
        
        searchingText = searchText
        if searchText == "" {
            isSearching = false
            getAllContacts()
        } else {
            isSearching = true
            searchContacts(contact_name: searchText)
        }
        contactsTableView.reloadData()
    }
    
}
