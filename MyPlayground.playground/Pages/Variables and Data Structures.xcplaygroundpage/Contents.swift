/*:  [Previous](@previous)    [HOME](Introduction)          [Next](@next)
 
 
 * Strings  https://developer.apple.com/documentation/swift/string
 * Dictionaries  https://developer.apple.com/documentation/swift/dictionary
 * Arrays   https://developer.apple.com/documentation/swift/array
 
 
*/

import Cocoa

let NPC = "Shawn"
var greeting = "Hello, playground"

var player = "Royal"
print(player)

player = "Azrael"
print(greeting)
print(player)

let quote = "So you \"think\" you can dance?"

let tvshow = """
The
Marvelous
Mrs
Maisel
"""
print(greeting.count)
print(greeting.uppercased())

print(player.hasPrefix("Az")) // if player starts with az
print(player.hasSuffix("le"))

var score = 10

let reallyBig = 1_000_000_000  // swift ignores the underscores
print(reallyBig)
let lowerScore = score-2
score += 10
print(score)
score *= 10
print(score)

let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))

let number2 =  0.1 + 0.2  // this is a hot mess. Don't use this. It thinks it is a double
print(number2)

// double are different than integers. INTs are always accurate. Decimals are different.
// can't mix int and double ... ie., 1 + 2.0
// need to do a + Int(b)
// or Doubl(a) + b
// Type Safety

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

// can't assign an integer into a string ie., player = 50

// string manipulation

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let num = 11
// let missionMessage = "Apollo " + num + " landed on the moon."
print("5 x 5 is \(5 * 5)")

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Adrian")

// temperatures.append("Chris")
let firstBeatle = beatles[0]
let firstNumber = numbers[0]
// let notAllowed = firstBeatle + firstNumber
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])


var albums = Array<String>()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")
print(albums)


// or

var albums2 = [String]()
albums2.append("Folklore")
albums2.append("Fearless")
albums2.append("Red")

// or
var albums3 = ["Folklore"]
albums3.append("Fearless")
albums3.append("Red")

print(albums3.count)


var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))


let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())


let presidents = ["Bush", "Obama", "Nobody", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)


// data dictionaries
let employee3 = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"]
//print(employee3["name"])
print(employee3["name", default: "Unknown"])


let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]


let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])


var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206


var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"

archEnemies["Batman"] = "Penguin"

// Using SETs; SETs automatically remove duplicate data
// unlike arrays, SETs are not in a particular order
// SETs store information that is optimized for retrieval
// setname.contains("name") is FAST, unlike arrays

let peopleset = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])

// SETs use insert whereas arrays use append
var peoples = Set<String>()
peoples.insert("Denzel Washington")
peoples.insert("Tom Cruise")
peoples.insert("Nicolas Cage")
peoples.insert("Samuel L Jackson")
peoples.count
print(peoples.sorted())


//enum Weekday {
//    case monday
//    case tuesday
//    case wednesday
//    case thursday
//    case friday
//}

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day2 = Weekday.monday
day = .tuesday
day = .friday

/*:
 ## TUPLES
 ---------------------------------
 */
// let's review Tuples
var product = ("MacBook", 1099.99)

// access tuple elements
print("Name:", product.0)
print("Price:", product.1)
// modify second value
product.1 = 1299.99

print("\nTuple After Modification: ")

// access tuple elements
print("Name:", product.0)
print("Price:", product.1)

var company = (product: "Programiz App", version: 2.1)
// access tuple element using name
print("Product:", company.product)
print("Version:", company.version)

// Nested Tuples

var alphabets = ("A", "B", "C", ("a", "b", "c"))

// access first element
print(alphabets.0)   // prints "A"

// access the third element
print(alphabets.3)

// access nested tuple
print(alphabets.3.0)  // prints "a"

// CANNOT add and remove elements from a Tuple

// In Swift, we can use a dictionary to add an element to a tuple.
// the third element of the tuple is a dictionary
// (String, String, Dictionary)
var laptopLaunch = ("MacBook", 1299, ["Nepal": "10 PM", "England": "10 AM"])
print(laptopLaunch.2)

// since there is a dictionary, we can add items
laptopLaunch.2["USA"] = "11 AM"
print(laptopLaunch.2)

// ------------------------

// Annotations
// type inference: Swift infers that surname is a string
// let surname = "Lasso"
// var score = 0

// Type Annotations are explicit
let surname: String = "Lasso"
var score2: Int = 0
var score3: Double = 0
let pi: Double = 3.141
var isAuthenticated: Bool = true
var myAlbums: [String] = ["Red", "Fearless"]

var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

// can define it but Swift will infer it
var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
// unless you want to make it empty to start
var teams: [String] = [String]() // option 1
var citiez: [String] = [] // option 2
var clues = [String]() // option 3 inference


enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light

// interesting use case! Constants

let uname: String
// lots of complex logic
uname = "@twostraws"  // setting constant later -- if this line were missing, Swift would complain
// lots more complex logic
print(uname)
