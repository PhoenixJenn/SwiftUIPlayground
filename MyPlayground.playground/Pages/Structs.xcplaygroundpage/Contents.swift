/*:  [Previous](@previous)    [HOME](Introduction)          [Next](@next)
 
 # Structs
*/

import Foundation


// ok, now into structs, which are essentially classes
               
struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}


let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

// --------------------------------

/*:
 struct Employee {
     let name: String
     var vacationRemaining: Int

    func takeVacation(days: Int) {
         if vacationRemaining > days {
             vacationRemaining -= days
             print("I'm going on vacation!")
             print("Days remaining: \(vacationRemaining)")
         } else {
             print("Oops! There aren't enough days remaining.")
         }
     }
 }
 
 This won't work. If we create an employee as a constant using let, Swift makes the employee and all its data constant – we can call functions just fine, but those functions shouldn’t be allowed to change the struct’s data because we made it constant.
 As a result, Swift makes us take an extra step: any functions that only read data are fine as they are, but any that change data belonging to the struct must be marked with a special mutating keyword, like this:
 
  func takeVacation(days: Int) { // <---- this is NOT OK in Swift.
 */





struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }

        set {
            vacationAllocated = vacationTaken + newValue
        }
    }

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

// can't use a "let archer" here because data is mutating. ie., can't call a mutating function on a constant
//var archer = Employee(name: "Archie Andrews", vacationRemaining: 14)
//archer.takeVacation(days: 5)
//print(archer.vacationRemaining)


/*:
 
 * Variables and constants that belong to structs are called properties.
 * Functions that belong to structs are called methods.
 * When we create a constant or variable out of a struct, we call that an instance – you might create a dozen unique instances of the Album struct, for example.
 * When we create instances of structs we do so using an initializer like this: Album(title: "Wings", artist: "BTS", year: 2016).
 */

let betty = Employee(name: "Betty Cooper", vacationAllocated: 14)
var veronica = Employee(name: "Veronica Lodge", vacationAllocated: 14)
var archie = Employee.init(name: "Archie Andrews", vacationAllocated: 14)

archie.vacationTaken += 4
print(archie.vacationRemaining)
archie.vacationTaken += 4
print(archie.vacationRemaining)






struct PenPalRecord {
    let myID: Int
    var myNickname: String
    var recommendedPenPalID: Int
}


// var myRecord = try JSONDecoder().decode(PenPalRecord.self, from: jsonResponse)


struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1


// newValue and oldValue are constants that come with Swift
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")



/// ------Initializing a struct---
///
///

struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)
