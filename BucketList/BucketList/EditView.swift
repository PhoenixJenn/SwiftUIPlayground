//
//  EditView.swift
//  BucketList
//
//  Created by Jennifer Lee on 7/25/24.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    var location: MapLocation

    @State private var name: String
    @State private var description: String
    var onSave: (MapLocation) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description

                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
    

    
    init(location: MapLocation, onSave: @escaping (MapLocation) -> Void) {
        self.location = location
        self.onSave = onSave

        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
}

#Preview {
    EditView(location: .example) { _ in }
}
