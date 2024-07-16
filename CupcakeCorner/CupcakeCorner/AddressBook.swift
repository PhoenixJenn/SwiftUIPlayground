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
    
    func retrieveAddres(){
         
//        if let SavedAddress = UserDefaults.standard.data(forKey: "SavedAddress") {
//            if let decodedAddress = try? JSONDecoder().decode([SavedAddress].self, from: SavedAddress) {
//                // without self. it won't let you set this since it is a constant/let
//                //self.SavedAddress = decodedAddress
//                return
//            }
//        }
        
        
//        if let savedAddress = UserDefaults.standard.data(forKey: "SavedAddress") as? Data {
//            let decoder = JSONDecoder()
//            if let loadedAddress = try? decoder.decode(SavedAddress.self, from: savedAddress) {
//                print(loadedAddress.name)
//            }
//        }
    }
    func saveAddress(){
//        var name = ""
//        var streetAddress = ""
//        var city = ""
//        var zip = ""
       // let address = Address(name: order.name, streetAddress: order.streetAddress, city: order.city, zip: order.zip)
       
//        addressBook.AddressArray.append(address)
//
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(order) {
//            let defaults = UserDefaults.standard
//            defaults.set(encoded, forKey: "SavedAddress")
//        }
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
            // let decoder = JSONDecoder()
            // if let decoded = try? decoder.decode([Habit].self, from: items) {
            //    self.items = decoded
            //    return
            //}
            if let decodedAddresses = try? JSONDecoder().decode([Address].self, from: addressArray) {
                // without self. it won't let you set this since it is a constant/let
                self.addressArray = decodedAddresses
                return
            }
        }
        self.addressArray = []
    }
    
    

}
