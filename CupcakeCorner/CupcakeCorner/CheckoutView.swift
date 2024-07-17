//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Jennifer Lee on 7/15/24.
//

import SwiftUI
import Foundation

struct CheckoutView: View {
    var order: Order
    @State private var alertTitle = ""
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @Environment(\.dismiss) var dismiss
    @ObservedObject var addressBook : AddressBook
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 233)
                    
                    Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                        .font(.title)
                    
                    Button("Place Order") {
                        Task {
                            await placeOrder()
                        }
                    }
                }
            }
            .navigationTitle("Check out")
//            .toolbar {
//                ToolbarItem(placement: .navigation) {
//                    Button("Home") {
//                        dismiss()
//                    }
//                }
//            }
            .navigationBarTitleDisplayMode(.inline)
            
            .scrollBounceBehavior(.basedOnSize)
            .alert("\(alertTitle)", isPresented: $showingConfirmation) {
                Button("OK") { }
            } message: {
                Text(confirmationMessage)
            }
            
        }
    }
    
    
    func saveAddress(){
        let address = Address(name: order.name, streetAddress: order.streetAddress, city: order.city, zip: order.zip)
        addressBook.addressArray.append(address)
    }
    
    func placeOrder() async {
        if order.saveAddressEnabled {
                saveAddress()
        }
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            // handle the result
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            alertTitle = "Thank you!"
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            print("Checkout failed: \(error.localizedDescription)")
            alertTitle = "Error"
            confirmationMessage = "Your order for FAILED!"
            showingConfirmation = true
        }
        
        
    }
}

#Preview {
    CheckoutView(order: Order(), addressBook: AddressBook())
}
