//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Jennifer Lee on 7/15/24.
//

import SwiftUI


struct AddressView: View {
  //  var order: Order  <- cannot find $order in scope
    //@State private var saveThisAddress = false
    
    @Bindable var order: Order

    @ObservedObject var addressBook : AddressBook
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
   
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
                
                // if validAddress AND (notInAddressBook -- hashable? use object and isDirty?)
                if order.hasValidAddress {
                    Toggle("Save to address book?", isOn: $order.saveAddressEnabled)
                    //.disabled(order.hasValidAddress == false)
                }

            }

            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: order, addressBook: addressBook)
                }
            }.disabled(order.hasValidAddress == false)
            
            
            Section{
                NavigationLink("Address Book") {
                    AddressBookView(order: order, addressBook: addressBook)

                } // NavigationLink

            } // section
                
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
        
        
        
    }
  
    func removeAddress(at offsets: IndexSet) {
        addressBook.addressArray.remove(atOffsets: offsets)
    }
    func selectAddress(name: String, streetAddress: String, city: String, zip: String){
        
    }
    
}

#Preview {
    AddressView(order: Order(), addressBook: AddressBook())
}
