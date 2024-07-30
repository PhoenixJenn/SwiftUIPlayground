//
//  ContentView.swift
//  Flashzilla
//
//  Created by Jennifer Lee on 7/29/24.
//

/*:
 
 Active scenes are running right now, which on iOS means they are visible to the user. On macOS an app’s window might be wholly hidden by another app’s window, but that’s okay – it’s still considered to be active.
 Inactive scenes are running and might be visible to the user, but the user isn’t able to access them. For example, if you’re swiping down to partially reveal the control center then the app underneath is considered inactive.
 Background scenes are not visible to the user, which on iOS means they might be terminated at some point in the future
 
 Command R to build and Run
 
 
 Challenge
 One of the best ways to learn is to write your own code as often as possible, so here are some ways you should try extending this app to make sure you fully understand what’s going on.

 []When adding a card, the text fields keep their current text. Fix that so that the textfields clear themselves after a card is added.
 []If you drag a card to the right but not far enough to remove it, then release, you see it turn red as it slides back to the center. Why does this happen and how can you fix it? (Tip: think about the way we set offset back to 0 immediately, even though the card hasn’t animated yet. You might solve this with a ternary within a ternary, but a custom modifier will be cleaner.)
 []For a harder challenge: when the users gets an answer wrong, add that card back into the array so the user can try it again. Doing this successfully means rethinking the ForEach loop, because relying on simple integers isn’t enough – your cards need to be uniquely identifiable.
 Still thirsty for more? Try upgrading our loading and saving code in two ways:

 []Make it use an alternative approach to saving data, e.g. documents JSON rather than UserDefaults, or SwiftData – this is generally a good idea, so you should get practice with this.
 []Try to find a way to centralize the loading and saving code for the cards. You might need to experiment a little to find something you like!
 */
import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    
    @State private var showingEditScreen = false
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //@State private var cards = Array<Card>(repeating: .example, count: 10)
    @State private var cards = [Card]()
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    var body: some View {
        
        ZStack {
            Image(decorative: "background")
             
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                            withAnimation {
                                removeCard(at: index)
                                if cards.isEmpty {
                                    isActive = false
                                }
                            }
                        }
                        .stacked(at: index, in: cards.count)
                        .allowsHitTesting(index == cards.count - 1)
                        .accessibilityHidden(index < cards.count - 1)
                    }
                } //zstack
                .allowsHitTesting(timeRemaining > 0)
                
                if cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.black)
                        .clipShape(.capsule)
                }
            } //Vstack
            
            // adding cards?
            
            VStack {
                HStack {
                    Spacer()

                    Button {
                        showingEditScreen = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                    }
                }

                Spacer()
            }
            .foregroundStyle(.white)
            .font(.largeTitle)
            .padding()
            
            if accessibilityDifferentiateWithoutColor || accessibilityVoiceOverEnabled {
                VStack {
                    Spacer()

                    HStack {
                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect.")

                        Spacer()

                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct.")
                    }
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
                }
            } // ALLY
            
            
        } // zstack
        .onReceive(timer) { time in
            guard isActive else { return }

            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                if cards.isEmpty == false {
                    isActive = true
                }
            } else {
                isActive = false
            }
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards, content: EditCards.init)
        .onAppear(perform: resetCards)
       
    } // body
    
    func removeCard(at index: Int) {
        guard index >= 0 else { return }
        cards.remove(at: index)
    }
    func resetCards() {
        cards = Array<Card>(repeating: .example, count: 10)
        timeRemaining = 100
        isActive = true
        loadData()
    }
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
    
}

#Preview {
    ContentView()
}



extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}

//            Text("")
//                .onChange(of: scenePhase) { oldPhase, newPhase in
//                    if newPhase == .active {
//                        print("Active")
//                    } else if newPhase == .inactive {
//                        print("Inactive")
//                    } else if newPhase == .background {
//                        print("Background")
//                    }
//                }
