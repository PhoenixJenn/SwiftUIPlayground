//
//  AddressBook.swift
//  CupcakeCorner
//
//  Created by Jennifer Lee on 7/16/24.
//

import Foundation

// struct address
// class address book

struct Address : Identifiable, Codable {
    var id = UUID()
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var saveAddressEnabled = false {
        didSet {
           
        }
    }
    

}

class AddressBook : ObservableObject {
    
    @Published var addressArray = [Address](){
        
        didSet {
            if let encoded = try? JSONEncoder().encode(addressArray) {
                UserDefaults.standard.set(encoded, forKey: "Addresses")
            }
        }
    }
    
    init() {
        if let addressArray = UserDefaults.standard.data(forKey: "Addresses") {

            if let decodedAddresses = try? JSONDecoder().decode([Address].self, from: addressArray) {
                // without self. it won't let you set this since it is a constant/let
                self.addressArray = decodedAddresses
                return
            }
        }
        self.addressArray = []
    }
    
    

}
