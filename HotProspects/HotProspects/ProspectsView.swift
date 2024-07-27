//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Jennifer Lee on 7/26/24.
//
// https://www.hackingwithswift.com/books/ios-swiftui/dynamically-filtering-our-swiftdata-query
// https://www.hackingwithswift.com/books/ios-swiftui/building-our-tab-bar
import SwiftUI
import SwiftData

struct ProspectsView: View {
    
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @Environment(\.modelContext) var modelContext
    
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    let filter: FilterType
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }
    
    var body: some View {
        
        
        NavigationStack {
            Text("People: \(prospects.count)")
                .navigationTitle(title)
                .toolbar {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        let prospect = Prospect(name: "Paul Hudson", emailAddress: "paul@hackingwithswift.com", isContacted: false)
                        modelContext.insert(prospect)
                    }
                }
            List(prospects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundStyle(.secondary)
                }
            }
        }
        
        
    }
    
    
    init(filter: FilterType) {
        self.filter = filter

        if filter != .none {
            let showContactedOnly = filter == .contacted

            _prospects = Query(filter: #Predicate {
                $0.isContacted == showContactedOnly
            }, sort: [SortDescriptor(\Prospect.name)])
        }
    }
   
}

#Preview {
   
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
