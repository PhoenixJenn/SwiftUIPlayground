/*:  [Previous](@previous)    [HOME](Introduction)          [Next](@next)
 
 This section includes If..Else, For, While, Switch..Case, Continue/Break
*/

import Foundation

var greeting = "Hello, playground"

let score = 85

if score > 80 {
    print("Control Loops - Great job!")
}
let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}


// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}

// Display the result
print(numbers)



let country = "Canada"

if country == "Australia" {
    print("G'day!")
}

// ---------------------------------
let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}

// Create the username variable
var username = "taylorswift13"

// If `username` contains an empty string
if username == "" {
    // Make it equal to "Anonymous"
    username = "Anonymous"
}

// Now print a welcome message
print("Welcome, \(username)!")

// --- how many letters; counting in Swift is expensive because it doesn't store the length

if username.count == 0 {
    username = "Anonymous"
}
// --- better....
if username.isEmpty == true {
    username = "Anonymous"
}
// --- best
if username.isEmpty {
    username = "Anonymous"
}



// --- adding else

let age = 16

if age >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}

let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

let temp = 65

if temp > 60 && temp < 80 {
    print("It's a nice day.")
}


let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}


// --- how enums work
enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun
switch forecast {
case .sun:
    print("It should be a nice sunny day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}


// ---- default: case always needs to be last
let place = "Metropolis"

switch place {
    
    case "Gotham":
        print("You're Batman!")
    case "Mega-City One":
        print("You're Judge Dredd!")
    case "Wakanda":
        print("You're Black Panther!")
    default:
        print("Who are you?")
}

// ---- use fallthrough to print everyting up to the case it matches. Aggregation
/*:
 That will match the first case and print “5 golden rings”, but the fallthrough line means case 4 will execute and print “4 calling birds”, which in turn uses fallthrough again so that “3 French hens” is printed, and so on.
 */
let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}


//: TERNARY OPERATORS
// --- +, -, ==, are binary operators
// using ternary operators Ternary operators work with three pieces of input,

let ageLimit = 18
let canVote = ageLimit >= 18 ? "Yes" : "No"
print("Can the user vote?" + canVote)


// ----
let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

// --- you can use in-place variables by escaping and putting in parens
let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)


// --- this is hard to read
enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)


// ---- FOR LOOPS


let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

// ---  you can also loop thru a range

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

for i in 1...12 {
    print("The \(i) times table:")

    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }

    print()
}


for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}


// --- WHILE LOOPS

var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

print(lyric)


let id = Int.random(in: 1...100)
let amount = Double.random(in: 0...1)


// --- Rolling a 20 sided die

// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// if we're here it means the loop ended – we got a 20!
print("Critical hit!")

/*:
 Swift gives us two ways to skip one or more items in a loop: continue skips the current loop iteration, and break skips all remaining iterations. Like while loops these are sometimes used, but in practice much less than you might think.
 
 Let’s look at them individually, starting with continue. When you’re looping over an array of data, Swift will take out one item from the array and execute the loop body using it. If you call continue inside that loop body, Swift will immediately stop executing the current loop iteration and jump to the next item in the loop, where it will carry on as normal. This is commonly used near the start of loops, where you eliminate loop variables that don’t pass a test of your choosing.
 */

// find all the filenames that include .jpg
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
        // if there was more here, it would be skipped
    }

    print("Found picture: \(filename)")
}


/*: As for break, that exits a loop immediately and skips all remaining iterations. To demonstrate this, we could write some code to calculate 10 common multiples for two numbers:
*/

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)


// to find all the combinations
let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
            }
        }
    }
}


/*:
 
 That goes over the same items multiple times to create an attempt array, and prints out a message if its attempt matches the secret combination.

 But that code has a problem: as soon as we find the combination we’re done with the loops, so why do they carry on running? What we really want to say is “as soon as the combination is found, exit all the loops at once” – and that’s where labeled statements come in. They let us write this:
 */

//: - Note: Swift let's us use LABELED statements!

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}


// ## How to provide default values for parameters


func printTimesTablesDefaults(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTablesDefaults(for: 5, end: 20)
printTimesTablesDefaults(for: 8)


var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll()
print(characters.count)

// to preserve capacity of the array
characters.removeAll(keepingCapacity: true)


// ## How to handle errors in functions
