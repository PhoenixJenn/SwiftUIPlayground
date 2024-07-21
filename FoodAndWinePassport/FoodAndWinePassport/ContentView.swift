//
//  ContentView.swift
//  FoodAndWinePassport
//
//  Created by Jennifer Lee on 7/20/24.
//

/*:
 Ratings and reviews per restaurant
 1 star (count) 2 star (count) 3 star (count) 4 star (count) 5 star (count)
 
 Locations
 LocationID : UUID
 Park : String
 Location : String
 
 
 [ ]Countries in Epcot
 [] France
 34 – ATTRACTION - Palais du Cinema
 35 – ATTRACTION - Remy’s Ratatouille Adventure
 – ATTRACTION - Beauty and the Beast Sing-a-Long (film)
 – ATTRACTION - Impressions de France (Circle-Vision film)
 67 – DINING - Le Vins des Ches de France
 68 – DINING - Chefs de France
 69 – DINING - Monsieur Paul
 70 – DINING - L’Artisan des Glaces
 71 – DINING - Les Halles Boulangerie-Patisserie
 72  – DINING - La Creperie de Paris
 82 – SHOPPING - La Signature Boutique
 – SHOPPING - Not listed – L’Esprit de la Provence
 
 [] Morocco
 66 – DINING - Spice Road Table
 - DINING - Not listed – Tangierine Café
 [] Japan
 61 – DINING - Kabuki Cafe (Snacks)
 62 – DINING - Katsura Grill (Quick Service)
 63 – DINING - Teppan Edo (Table Service)
 64 – DINING - Shiki-Sai: Sushi Izakaya
 65 – DINING - Takumi-Tei
 
 [] America
 32 – ATTRACTION - America Gardens Theatre (concert stage)
 33 – ATTRACTION - The American Adventure
 57 – REFRESHMENTS - Joffrey’s Coffee & Tea Company
 58 – DINING - Fife & Drum Tavern (Snacks, Beer)
 59 – DINING - Regal Eagle Smokehouse: Craft Drafts & Barbeque (Quick Service)
 60 – DINING - Funnel Cake
 81 – SHOPPING - Art of Disney
 
 [] Italy
 53 – DINING - Tutto Italia Ristorante
 54 – DINING - Tutto Gusto Wine Cellar
 55 – DINING - Via Napoli Ristorante e Pizzeria
 56 – DINING - Gelateria Toscana
 
 [] Germany
 51 – DINING - Biergarten Restaurant (Table Service)
 52 – DINING - Sommerfest (Quick Service)
 80 – SHOPPING -  Karamell-Kuche – Caramel popcorn and Werther’s Originals candies
 [] Outpost
 50 – REFRESHMENTS - Refreshment Outpost (Quick Service)
 
 [] China
 31 – ATTRACTION - Reflections of China (Circle-Vision film)
 47 – DINING - Nine Dragons Restaurant
 48 – DINING - Lotus Blossom Cafe
 49  – DINING - The Joy of Tea
 - SHOPPING -
 Lots of shopping in the back, and small booths set up through the pavilion
 
 [] Norway
 29 – ATTRACTION - Meet Anna and Elsa at Royal Summerhus
 30 – ATTRACTION - Frozen Ever After
 45 – DINING - Kringla Bakeri Og Kafe (Quick-Service)
 46 – DINING - Akershus Royal Banquet Hall
  - SHOPPING - A shop with lots of Norway apparel, traditional wooden troll sculptures, etc. Pop in for a photo with the giant troll!
 
 [] Mexico
 - SHOPPING - Inside the Pyramid, Ring kiosk outside pyramid
 28  – ATTRACTION - Gran Fiesta Tour Starring Three Caballeros (Donald Duck!)
 26 – Gran Fiesta Tour Starring Three Caballeros (Donald Duck!)
 40 – DINING - Choza de Margarita
 41 – DINING - La Cantina de San Angel (Quick-Service)
 42 – DINING - La Hacienda de San Angel (Table-Service)
 43 – DINING - La Cava del Tequila (bar)
 44 – DINING - San Angel Inn Resaurante (Table-Service)
 
 [] Canada

 36 – ATTRACTION - Canada Far and Wide (Circle-Vision film)
 76 – REFRESHMENTS - Joffrey’s Coffee & Tea Company
 77 – DINING - Le Cellier Steakhouse (Table-Service)
 
 [] UK
 73 – DINING - Yorkshire County Fish Shop (Quick-Service)
 74 – DINING - Rose & Crown Pub (lounge)
 75 – DINING - Rose & Crown Dining Room (Table-Service)
 84 – SHOPPING - The Tea Caddy
 
 []World Showcase Gateway
 37 – REFRESHMENTS - Refreshment Port
 38 – REFRESHMENTS - Swirled Showcase
 39 – REFRESHMENTS - Joffrey’s Coffee & Tea Company

 78 –  SHOPPING - Port of Entry
 79 –  SHOPPING - Disney Traders
 80 –  SHOPPING - Karamell-Kuche
 81 –  SHOPPING - Art of Disney
 82 –  SHOPPING - La Signature
 83 –  SHOPPING - World Traveler
 84 –  SHOPPING - The Tea Caddy
 85 –  SHOPPING - Northwest Mercantile
 
 
 []World Celebration (Mr Epcot)
 Attractions
 1 – ATTRACTION - Spaceship Earth
 2 – ATTRACTION - Disney & Pixar Short Film Festival
 3 – ATTRACTION - Journey Into Imagination with Figment
 Dining
 4 – REFRESHMENTS - Connections Cafe (Starbucks)
 5 – REFRESHMENTS - Connections Eatery
 Shopping
 6 –  SHOPPING - Pin Traders – Camera Center
 7 –  SHOPPING - Gateway Gifts
 8 –  SHOPPING - Club Cool
 9 –  SHOPPING - Creations Shop
 
 [] World Discovery Area
 Attractions
 10 – Guardians of the Galaxy: Cosmic Rewind
 11 – Mission: SPACE
 Green Mission (less intense)
 Orange Mission (more intense)
 12 – Test Track
 13 – Play Zone
 Dining
 14 – Refreshment Station (open seasonally)
 15 – Joffrey’s Coffee & Tea Company
 16 –  Space 220 (Table Service)
 Space 220 Lounge
 Shopping
 17 – Treasures of Xandar at Guardians of the Galaxy: Cosmic Rewind
 Mission: Space Gift Shop (go in the ride exit — see #11)
 Test Track Gift Shop (go in the ride exit — see #12)
 
 
 [] World Nature Area
 Attractions
 18 – Journey of Water, Inspired by Moana
 19 – Awesome Planet
 20 – Soarin’ Around the World
 21 – Living with the Land
 22 – The Seas with Nemo & Friends
 23 – Turtle Talk with Crush
 24 – SeaBase
 Dining
 25 – Sunshine Seasons (Quick Service)
 26 – Chip ‘n’ Dale’s Harvest Feast at Garden Grill Restaurant (Table Service)
 27 – Coral Reef Restaurant (Table Service)
 */
import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query var locations: [Location]
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        
        VStack {
            NavigationStack {
                Text("Locations")
                List(locations) { location in
                    Text(location.location)
                    Text(location.park)
                    
                }
                .navigationTitle("Classroom")
                .toolbar {
                    Button("Welcome") {
                        loadData()
                    }
                }
            }
        }
        .padding()
    }
    
    func loadData(){
//        let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
//        modelContext.insert(student)
    }
}

#Preview {
    ContentView()
}
