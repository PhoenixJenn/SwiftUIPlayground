/*:  [Previous](@previous)    [HOME](Introduction)          [Next](@next)
 
# Protocols and Extensions
 Protocols let us define contracts that conforming types must adhere to, and extensions let us add functionality to existing types.
 
 protocol extensions:
 protocols can’t provide implementations for methods
 
 * Protocols are like contracts for code: we specify the functions and methods that we required, and conforming types must implement them.
 * Opaque return (ie., using vehicles: [Vehicle]) types let us hide some information in our code. That might mean we want to retain flexibility to change in the future, but also means we don’t need to write out gigantic return types.
 * Extensions let us add functionality to our own custom types, or to Swift’s built-in types. This might mean adding a method, but we can also add computed properties.
 * Protocol extensions let us add functionality to many types all at once – we can add properties and methods to a protocol, and all conforming types get access to them.
 
*/
import Foundation


/*:
 creating new structs, classes, or enums that implement the requirements for that protocol, which is a process we call adopting or conforming to the protocol.
 */

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}


struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
    func openSunroof() {
        print("It's a nice day!")
    }
}

//“this parameter must be a car”, we can instead say “this parameter can be anything at all, as long as it’s able to estimate travel time and move to a new location.”
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)

// ---------- Opaque Return Types - vehicles: [Vehicle]
func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}
getTravelEstimates(using: [car, bike], distance: 150)



// # Opaque Return Types

/*:
 Both Int and Bool conform to a common Swift protocol called Equatable, which means “can be compared for equality.” The Equatable protocol is what allows us to use ==, like this:
 */

func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

print("here ----------")

print(getRandomNumber() == getRandomNumber())

func getRandomBool() -> Bool {
    Bool.random()
}
//
//func getRandomNumber2() -> Equatable {
//    Int.random(in: 1...6)
//}
//
//func getRandomBool2() -> Equatable {
//    Bool.random()
//}

/*:
 Returning a protocol from a function is useful because it lets us hide information: rather than stating the exact type that is being returned, we get to focus on the functionality that is returned. In the case of a Vehicle protocol, that might mean reporting back the number of seats, the approximate fuel usage, and a price. This means we can change our code later without breaking things: we could return a RaceCar, or a PickUpTruck, etc, as long as they implement the properties and methods required by Vehicle.
 
 To upgrade our two functions to opaque return types, add the keyword some before their return type, like this:
 */

func getRandomNumberX() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBoolX() -> some Equatable {
    Bool.random()
}

/*:
 
 Returning an opaque return type means we still get to focus on the functionality we want to return rather than the specific type, which in turn allows us to change our mind in the future without breaking the rest of our code. For example, getRandomNumber() could switch to using Double.random(in:) and the code would still work great.
 
 we can return the type some View, which means that some kind of view screen will be returned but we don’t want to have to write out its mile-long type.
 
 So, when you see some View in your SwiftUI code, it’s effectively us telling Swift “this is going to send back some kind of view to lay out, but I don’t want to write out the exact thing – you figure it out for yourself.”
 */



// # Extensions


var quote = "   The truth is rarely pure and never simple   "

let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)


extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

let trimmed3 = quote.trimmed()

// We could have done this

func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}
let trimmed2 = trim(quote)


/*:
 However, the extension has a number of benefits over the global function, including:

 When you type quote. Xcode brings up a list of methods on the string, including all the ones we add in extensions. This makes our extra functionality easy to find.
 
 Writing global functions makes your code rather messy – they are hard to organize and hard to keep track of. On the other hand, extensions are naturally grouped by the data type they are extending.
 
 Because your extension methods are a full part of the original type, they get full access to the type’s internal data. That means they can use properties and methods marked with private access control, for example.
 */


/*:
 
 one property I like to add to strings is called lines, which breaks the string up into an array of individual lines.
 
 This wraps another string method called components(separatedBy:), which breaks the string up into a string array by splitting it on a boundary of our choosing.
 
 In this case we’d want that boundary to be new lines, so we’d add this to our string extension:
 */



struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int

//    init(title: String, pageCount: Int) {
//        self.title = title
//        self.pageCount = pageCount
//        self.readingHours = pageCount / 50
//    }
}


extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the rings", pageCount:356)


print (lotr.readingHours)

// an extension on string
extension String {
    mutating func append(_ other: String) {
        self += other
    }
}


extension Int {
    func times(_ action: () -> Void) {
        for _ in 0..<self {
            action()
        }
    }
}


extension Array {
    func summarize() {
        print("The array has \(count) items. They are:")
        for item in self {
            print(item)
        }
    }
}


extension String {
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
}

/*:
--------------------------------------------
# PROTOCOL EXTENSIONS
 
 */
print("-------- Protocol Extensions ------------")
let guests = ["Mario", "Luigi", "Peach"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}


if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}
print("--------  Extending Array ------------")
extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

/*:
 
what about sets and dictionaries?\
 Array, Set, and Dictionary all conform to a built-in protocol called Collection, through which they get functionality such as contains(), sorted(), reversed(), and more.
 */

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

print("--------  Print Set ------------")
var mySet = Set(["Azrael", "Lucyfur", "Mara Jade"])
print("--------  Print Set 1 ------------")
if(mySet.isNotEmpty){ print(mySet)}
print("--------  Print Set 2 ------------")
if(mySet.isNotEmpty){mySet.forEach{animal in print(animal)}}



protocol Person {
    var name: String { get }
    func sayHello() ->()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()



let numbers = [4, 8, 15, 16]
let allEven = numbers.allSatisfy { $0.isMultiple(of: 2) }
let numbers2 = Set([4, 8, 15, 16])
let allEven2 = numbers2.allSatisfy { $0.isMultiple(of: 2) }
let numbers3 = ["four": 4, "eight": 8, "fifteen": 15, "sixteen": 16]
let allEven3 = numbers3.allSatisfy { $0.value.isMultiple(of: 2) }


print("--------------------")

protocol Anime {
    var availableLanguages: [String] { get set }
    func watch(in language: String)
}
extension Anime {
    func watch(in language: String) {
        if availableLanguages.contains(language) {
            print("Now playing in \(language)")
        } else {
            print("Unrecognized language.")
        }
    }
}

print("------extension of Numeric type --------------")
extension Numeric {
    func squared() -> Self {
        self * self
    }
}

var sqrd : Int = 7
print(sqrd.squared())


print("-------Equatable is a built-in protocol ... Comparable is also a built-in protocol -------------")
struct User: Equatable, Comparable {
    let name: String
}
/*:
 We actually don't need Equatable to make it work.
 
 struct User: Comparable {
     let name: String
 }
 */
let user1 = User(name: "Link")
let user2 = User(name: "Zelda")
print(user1 == user2)
print(user1 != user2)

print("--------------------")
func <(lhs: User, rhs: User) -> Bool {
    lhs.name < rhs.name
}

let user3 = User(name: "Taylor")
let user4 = User(name: "Adele")
print(user3 < user4)
print("--------------------")




print("This is the end")

