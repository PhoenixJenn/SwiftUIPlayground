//
//  AddressBookView.swift
//  CupcakeCorner
//
//  Created by Jennifer Lee on 7/16/24.
//

import SwiftUI

struct AddressBookView : View {
  
    @Bindable var order: Order
    @ObservedObject var addressBook : AddressBook
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("AddressBook")
            .font(.title)
        List {
            ForEach(Array(addressBook.addressArray.enumerated()), id: \.offset) { index, address in
                HStack{
                    VStack(alignment: .leading) {
                        Text("\(addressBook.addressArray[index].name)")
                        Text("\(addressBook.addressArray[index].streetAddress)")
                        Text("\(addressBook.addressArray[index].city)")
                        Text("\(addressBook.addressArray[index].zip)")
                        
//                        Button(
//                           action: {
//                               order.name = addressBook.addressArray[index].name
//                               order.streetAddress = addressBook.addressArray[index].streetAddress
//                               order.city = addressBook.addressArray[index].city
//                               order.zip = addressBook.addressArray[index].zip
//                               
//                               
//                               // TODO
//                               // disable the 'save address' toggle unless the address is changed
//                               // the following does not work
//                               // order.saveAddressEnabled = false
//                               dismiss()
//                               //selectAddress()
//                           }
//                        ) {
//                            Text("Select")
//                        } // Button
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color.blue)
                        
                        // choose address
                        // dismiss()
                    } //Vstack
                Spacer()
             
                    Button(
                       action: {
                           order.name = addressBook.addressArray[index].name
                           order.streetAddress = addressBook.addressArray[index].streetAddress
                           order.city = addressBook.addressArray[index].city
                           order.zip = addressBook.addressArray[index].zip
                           
                           
                           // TODO
                           // disable the 'save address' toggle unless the address is changed
                           // the following does not work
                           // order.saveAddressEnabled = false
                           dismiss()
                           //selectAddress()
                       }
                    ) {
                        Text("Select")
                    } // Button
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                } // Hstack
                .fontDesign(.rounded)
                .fontWidth(.condensed)
                .lineSpacing(50)
                
            } // Foreach
            .onDelete(perform: removeAddress)
            Text("Addresses Saved: \(addressBook.addressArray.count)")
                .foregroundColor(.red)
           // Divider()
        }// List
    }
    func removeAddress(at offsets: IndexSet) {
        addressBook.addressArray.remove(atOffsets: offsets)
    }
    func selectAddress(name: String, streetAddress: String, city: String, zip: String){
        
    }
}

#Preview {
    AddressBookView(order : Order(), addressBook : AddressBook() )
}
