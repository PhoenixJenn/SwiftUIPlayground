//
//  DetailView.swift
//  FriendFace
//
//  Created by Jennifer Lee on 7/22/24.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @State var person: Person
    
    
    var body: some View {
        VStack{
            
            //ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    List{
                        Section {
                            Text("Hello, \(person.name)!")
                            Text("Age: \(person.age)")
                            Text("Email: \(person.email)")
                            Text("Address: \(person.address)")
                        } header: {
                            Text("Basic Info")
                        }
                        Section {
                            Text(person.about)
                        } header: {
                            Text("About")
                        }
                        
                        Section {
                            ForEach(person.tags.indices, id: \.self) {
                                Text(person.tags[$0])
                            }
                            
                        } header: {
                            Text("Friends")
                        }
                    } //list
                    .navigationTitle(person.name)
                    .navigationBarTitleDisplayMode(.inline)
                    
                } //hstack
            //} //scrollview
            
        } //vstack
    } //body
}

#Preview {

    
    do {
           let config = ModelConfiguration(isStoredInMemoryOnly: true)
           let container = try ModelContainer(for: Person.self, configurations: config)
        
        let fakefriend1 = Friend(id:UUID(), name:"Bill Gates")
        let fakefriend2 = Friend(id:UUID(), name:"Lady Gaga")
        let fakefriends = [fakefriend1, fakefriend2]
        
        let example = Person(id: UUID(), isActive: true, name: "Jenn", age: 25, company: "Not Audible", email: "Jenn@gmail.com", address: "", about: "", registered: Date.now, tags: [""], friends: [])
        //example.friends = fakefriends

           return DetailView(person: example)
               .modelContainer(container)
       } catch {
           return Text("Failed to create preview: \(error.localizedDescription)")
       }
     
}
