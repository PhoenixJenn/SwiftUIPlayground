//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Jennifer Lee on 7/26/24.
//
// https://www.hackingwithswift.com/books/ios-swiftui/dynamically-filtering-our-swiftdata-query
// https://www.hackingwithswift.com/books/ios-swiftui/building-our-tab-bar
//https://github.com/twostraws/CodeScanner

import SwiftUI
import SwiftData
import CodeScanner

struct ProspectsView: View {
    @State private var isShowingScanner = false
    @State private var selectedProspects = Set<Prospect>()
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
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Scan", systemImage: "qrcode.viewfinder") {
                            isShowingScanner = true
                        }
                    }

                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }

                    if selectedProspects.isEmpty == false {
                        ToolbarItem(placement: .bottomBar) {
                            Button("Delete Selected", action: delete)
                        }
                    }
                }
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
                }
            
            List(prospects, selection: $selectedProspects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundStyle(.secondary)
                }
                .swipeActions {
                    if prospect.isContacted {
                        Button("Delete", systemImage: "trash", role: .destructive) {
                            modelContext.delete(prospect)
                        }
                        Button("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.blue)
                    } else {
                        Button("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.green)
                        
                        // Thanks to SwiftUI and SwiftData's tight integration, just calling toggle() on our property will flip the Boolean, update our view, and save the change to permanent storage – all in just one line of code.
                    }
                } // swipe actions
                .tag(prospect)
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
    func delete() {
        for prospect in selectedProspects {
            modelContext.delete(prospect)
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
       isShowingScanner = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }

            let person = Prospect(name: details[0], emailAddress: details[1], isContacted: false)

            modelContext.insert(person)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
   
}

#Preview {
   
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
