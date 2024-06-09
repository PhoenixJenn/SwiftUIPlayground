/*:  [Previous](@previous)    [HOME](Introduction)          [Next](@next)
 
 # Structs
 * Member Constants/Variables
 * memberwise initializer
 * Mutating Methods
 * Setters and Getters
 * didSet, willSet
 * Instantiation
*  Private Members + Instantiation rules
 * Static Properties and Methods
 
 
 https://www.hackingwithswift.com/quick-start/beginners/summary-structs
 
 
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



// private members
/*:
 Use private for “don’t let anything outside the struct use this.”
 Use fileprivate for “don’t let anything outside the current file use this.”
 Use public for “let anyone, anywhere use this.”
 private(set) --- lets anything read but only private modify
 */


struct BankAccount {
    private var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}



var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

// With private variables, you need to initiate your struct. For Example


struct SecretAgent {
    private var actualName: String
    public var codeName: Int
    init(name: String, codeName: Int) {
        self.actualName = name
        self.codeName = codeName
    }
}
let bond = SecretAgent(name: "James Bond", codeName: 007)


// valid
struct Appl {
    var name: String
    private var sales = 0
    init(name: String) {
        self.name = name
    }
}
let spotify = Appl(name: "Spotify")

// valid
struct Contributor {
    private var name = "Anonymous"
}
let paul = Contributor()


// valid

struct School {
    var staffNames: [String]
    private var studentNames: [String]
    init(staff: [String]) {
        self.staffNames = staff
        self.studentNames = [String]()
    }
}
let royalHigh = School(staff: ["Mrs Hughes"])

/*:
 This is incorrect.It has a private member variable so Swift is unable to initialize
 
 struct Doctor {
     var name: String
     var location: String
     private var currentPatient = "No one"
 }
 let drJones = Doctor(name: "Esther Jones", location: "Bristol")
 */

// Static Properties and Methods
// https://www.hackingwithswift.com/quick-start/beginners/static-properties-and-methods
// in the following example, both studentCount and add method belong to the struct itself, not to an individual instance of a high school.
struct HighSchool {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined our regional highschools.")
        studentCount += 1
    }
}

HighSchool.add(student: "Archie Andrews")
print(HighSchool.studentCount)

// in an instance, you can read static information

/*:
 To access static code from non-static code, always use your type’s name such as School.studentCount. You can also use Self to refer to the current type.
 Now we have self and Self, and they mean different things: self refers to the current value of the struct, and Self refers to the current type.
 */


// use static data to organize your cose. The beauty is that you don't have to instantiate it to use the static variables.

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}
print(AppData.version)

// example for struct

struct CastMember {
    let username: String
    let password: String

    static let example = CastMember(username: "waltdisney", password: "cyar3als00n")
}
print(CastMember.example)

print(CastMember.self)


// some valid examples

struct NewsStory {
    static var breakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    init(headline: String, isBreaking: Bool) {
        self.headline = headline
        if isBreaking {
            NewsStory.breakingNewsCount += 1
        } else {
            NewsStory.regularNewsCount += 1
        }
    }
}


// make sure to use the Struct to access population

struct Person {
    static var population = 0
    var name: String
    init(personName: String) {
        name = personName
        Person.population += 1
    }
}


/*:
 # CHECKPOINT
 
 create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?
 */

struct Car {
    static let make = "BMW"
    static let model = "3 Series"
    let numSeats: Int
    private(set) var currentGear: Int
    
    init(numSeats: Int, currentGear: Int) {
        self.numSeats = numSeats
        self.currentGear = currentGear
    }
    
    mutating func shiftGear(newGear: Int) -> String{
        let numGears = 5
        if (newGear > 5 || newGear < 1 ){
            return "What have you done to your car?!"
        }
        self.currentGear = newGear
        return "Zoom zoom at gear \(newGear)"
    }
    
}

var myCar = Car(numSeats: 2, currentGear: 2)
print(myCar.currentGear)
print(myCar.shiftGear(newGear: 4))



// Last Exampls:

struct Dictionary {
    var words = Set<String>()
}
let dictionary = Dictionary()



struct Country {
    var name: String
    var usesImperialMeasurements: Bool
    init(countryName: String) {
        name = countryName
        let imperialCountries = ["Liberia", "Myanmar", "USA"]
        if imperialCountries.contains(name) {
            usesImperialMeasurements = true
        } else {
            usesImperialMeasurements = false
        }
    }
}
