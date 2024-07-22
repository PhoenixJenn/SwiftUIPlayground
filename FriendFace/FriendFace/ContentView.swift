//
//  ContentView.swift
//  FriendFace
//
//  Created by Jennifer Lee on 7/21/24.
//
/*:
 []Your first step should be to examine the JSON. The URL you want to use is this: https://www.hackingwithswift.com/samples/friendface.json
 []As you can see, there is an array of people, and each person has an ID, name, age, email address, and more. They also have an array of tag strings, and an array of friends, where each friend has a name and ID.
 []Fetch the data and parse it into User and Friend structs.
 []Display a list of users with a little information about them, such as their name and whether they are active right now.
 [] Create a detail view shown when a user is tapped, presenting more information about them, including the names of their friends.
 []Before you start your download, check that your User array is empty so that you don’t keep starting the download every time the view is shown.
 try? modelContext.delete(model: Person.self)
 
 []start by designing your types: build a User struct with properties for name, age, company, and so on,
 [] then a Friend struct with id and name.
 [] dsed3After that, move onto some URLSession code to fetch the data and decode it into your types.
 
 * Advanced user solve example : https://medium.com/@viktormauzer/solving-friendface-100daysofswiftui-challenge-day-60-61-754309014448
 */
import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var people = [Person]()
    @Environment(\.modelContext) var modelContext
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            
            NavigationView {
                List(people) { person in
                    HStack{
                        Text("\(person.age)")
                            .padding()
                            .background(colorScheme == .dark ? .black : .white)
                            //.background(.white)
                            .clipShape(Circle())
                            .frame(width: 70)
                            .overlay(
                                    Circle()
                                        .stroke(person.isActive ? Color.green : Color.red, lineWidth: 2)
                                )
                            .padding([.top, .bottom, .trailing], 5)
                        VStack(alignment: .leading){
                            Text(person.name)
                                .font(.headline)
                            Text(person.isActive ? "Active" : "Offline")
                                .font(.subheadline)
                                .foregroundColor(person.isActive ? .green : .red)
                        }
                        
                    }
                    
                }
                .navigationTitle("FriendFace")
                .task {
                    if let retrievedData = await getData() {
                        people = retrievedData
                    }
                }
            }
            .padding()
        }
    }
    
        
    func getData() async -> [Person]?{
        // the url is force unwrapped 
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData = try decoder.decode([Person].self, from: data)
            return decodedData
        } catch {
            //print(error)
            print("HTTP Request Failed: \(error.localizedDescription)")
        }
        return nil
    }
        /*:
         ADVANCED SOLUTION ----->
         follow parts of this for help
         https://github.com/viktormauzer/FriendFaceChallenge
         https://medium.com/@viktormauzer/solving-friendface-100daysofswiftui-challenge-day-60-61-754309014448
         
         //// ------->
         
         https://cocoacasts.com/networking-fundamentals-how-to-make-an-http-request-in-swift
         https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-orders-over-the-internet
         https://www.hackingwithswift.com/100/swiftui/61
         https://www.hackingwithswift.com/guide/ios-swiftui/5/3/challenge
         
         
         
         The completion handler, a closure, is executed when the data task completes, successfully or unsuccessfully. The completion handler accepts three arguments, an optional Data object, an optional URLResponse object, and an optional Error object.
         
         A data task fails or succeeds.
         If the data task fails, then error has a value.
         If the data task succeeds, then data and response have a value. We are not interested in the URLResponse object for now.
         We safely unwrap the Data object and use it to create a Person instance. I
        
*/
    
}

#Preview {
    do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Person.self, configurations: config)
        let friend = Friend(id:UUID(), name: "Travis")
        let user = Person(id: UUID(), isActive:true, name: "Taylor Swift", age: 35, company: "Nashville", email: "taylor@23.com", address: "12 sesame street", about: "stuff", registered: .now, tags: ["a","b"], friends: [friend])
                          
            return ContentView()
                .modelContainer(container)
        } catch {
            return Text("Failed to create container: \(error.localizedDescription)")
        }
    

}
