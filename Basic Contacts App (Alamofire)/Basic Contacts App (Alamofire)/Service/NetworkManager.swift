//
//  File.swift
//  Basic Contacts App (Alamofire)
//
//  Created by Hasan Esat Tozlu on 8.10.2022.
//

import UIKit
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "http://kasimadalan.pe.hu/kisiler/"
    private init() {}
    
    func getAllContact(completion: @escaping ([Contact]?) -> Void) {
        let endPoint = baseURL + "tum_kisiler.php"
        
        guard let url = URL(string: endPoint) else { return }
        
        AF.request(url, method: .get).response { response in
            guard let data = response.data else { return }
            do {
                let contactsResponse = try JSONDecoder().decode(ContactsResponse.self, from: data)
                if let contacts = contactsResponse.kisiler {
                    completion(contacts)
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    func searchContacts(contact_name: String, completion: @escaping ([Contact]?) -> Void) {
        let endPoint = baseURL + "tum_kisiler_arama.php"
        let parameters: Parameters = ["kisi_ad":contact_name]
        
        guard let url = URL(string: endPoint) else { return }
        
        AF.request(url, method: .post, parameters: parameters).response { response in
            
            if let data = response.data {
                do {
                    let searchedContactResponse = try JSONDecoder().decode(ContactsResponse.self, from: data)
                    if let searchedContacts = searchedContactResponse.kisiler {
                        completion(searchedContacts)
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    func deleteContacts(contact_id: String, success completion: @escaping (Bool) -> Void) {
        let endPoint = baseURL + "delete_kisiler.php"
        let parameters: Parameters = ["kisi_id":contact_id]
        
        guard let url = URL(string: endPoint) else { return }
        
        AF.request(url, method: .post, parameters: parameters).response { response in
            
            if let data = response.data {
                do {
                    if let _ = try JSONSerialization.jsonObject(with: data) as? [String:Any] {
                        completion(true)
                    }
                } catch {
                    completion(false)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    func updateContacts(contact_id: String, contact_name: String, contact_phone: String) {
        let endPoint = baseURL + "update_kisiler.php"
        let parameters: Parameters = ["kisi_id":contact_id,"kisi_ad":contact_name, "kisi_tel":contact_phone]
        
        guard let url = URL(string: endPoint) else { return }
        
        AF.request(url, method: .post, parameters: parameters).response { response in
            
            if let data = response.data {
                do {
                    guard let _ = try JSONSerialization.jsonObject(with: data) as? [String:Any] else { return }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    func addContacts(contact_name: String, contact_phone: String) {
        let endPoint = baseURL + "insert_kisiler.php"
        let parameters: Parameters = ["kisi_ad":contact_name, "kisi_tel":contact_phone]
        
        guard let url = URL(string: endPoint) else { return }
        
        AF.request(url, method: .post, parameters: parameters).response { response in
            
            if let data = response.data {
                do {
                    guard let _ = try JSONSerialization.jsonObject(with: data) as? [String:Any] else { return }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
