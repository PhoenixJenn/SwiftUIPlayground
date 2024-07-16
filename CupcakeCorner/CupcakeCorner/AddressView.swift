//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Jennifer Lee on 7/15/24.
//

import SwiftUI

struct AddressView: View {
  //  var order: Order  <- cannot find $order in scope
    @Bindable var order: Order

    var body: some View {
   
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }

            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: order)
                }
            }.disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
        
        
        
    }
    
}

#Preview {
    AddressView(order: Order())
}
