/*:  [Previous](@previous)    [HOME](Introduction)          [Next](@next)
 
 # Error Handling 101
 
 * Throwing Functions
 * Optionals
 * Unwrapping optionals https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-make-us-unwrap-optionals
 * guard let https://www.hackingwithswift.com/quick-start/beginners/how-to-unwrap-optionals-with-guard
*/

import Foundation



enum PasswordError: Error {
    case short, obvious
}


/*:
 
 That says there are two possible errors with password: short and obvious. It doesn’t define what those mean, only that they exist.

 Step two is to write a function that will trigger one of those errors. When an error is triggered – or thrown in Swift – we’re saying something fatal went wrong with the function, and instead of continuing as normal it immediately terminates without sending back any value.

 In our case, we’re going to write a function that checks the strength of a password: if it’s really bad – fewer than 5 characters or is extremely well known – then we’ll throw an error immediately, but for all other strings we’ll return either “OK”, “Good”, or “Excellent” ratings.


 */

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}


/*:
 
(1) If a function is able to throw errors without handling them itself, you must mark the function as throws before the return type.\
(2) We don’t specify exactly what kind of error is thrown by the function, just that it can throw errors.\
 (3)Being marked with throws does not mean the function must throw errors, only that it might.\
 (4)When it comes time to throw an error, we write throw followed by one of our PasswordError\ cases. This immediately exits the function, meaning that it won’t return a string.
 (5) If no errors are thrown, the function must behave like normal – it needs to return a string.
 */



// REAL Error Handling!


//do {
//    try someRiskyWork()
//} catch {
//    print("Handle errors here")
//}



let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}


/*:
 
 Tip: Most errors thrown by Apple provide a meaningful message that you can present to your user if needed. Swift makes this available using an error value that’s automatically provided inside your catch block, and it’s common to read error.localizedDescription to see exactly what happened.
 
 */


do {
  let data = "hello, world".data(using: .utf8)!
  let decoder = JSONDecoder()
  let string = try decoder.decode(String.self, from: data)
} catch is DecodingError {
  print("something went wrong while decoding!")
} catch { error
  print("something went wrong!")
  print(error)
}


// you can use try?  --> https://www.donnywals.com/working-with-throwing-functions-in-swift/


// you can rethrow and error

func execute(_ closure: (() throws -> Void)) rethrows {
  try closure()
}

execute {
  print("hello!")
}

//do {
//  try execute {
//    throw MyError.myErrorCase
//  }
//} catch {
//  print(error)
//}



//
//func doSomething() throws {
//  throw MyError.myErrorCase
//
//  print("This is never printed")
//}


enum BuildingError: Error {
    case tooHigh
    case tooLow
}
func constructBuilding(floors: Int) throws {
    if floors < 10 {
        throw BuildingError.tooLow
    } else if floors > 500 {
        throw BuildingError.tooHigh
    }
    print("Perfect - let's get building!")
}

// constructBuilding(floors: 13)


/*:
 -----Optionals
 */

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

// String? means there might be a string waiting inside for us, or there might be nothing at all – a special value called nil, that means “no value”

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

/*:
 an array of integers might contain one or more numbers, or perhaps no numbers at all, but both of those are different from optional arrays set to nil.
 */


func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

// use "if let " when assigning to unwrap the optional
if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

/*:
 
 > Note: You can also do this, VERY COMMON in Swift
 temporarily creating a second constant called number. The new temp constant only works in the braces.
 Called shadowing
 
 if let number = number {
    // valid to use new 'number' variable
     print(square(number: unwrappedNumber))
    // valid to use new 'number' variable
 }
 // no longer valid to use new 'number'
 
 */
var num1 = 1_000_000
var num2 = 0
var num3: Int? = nil

var str1 = "Hello"
var str2 = ""
var str3 : String? = nil

var arr1 = [0]
var arr2 = [Int]()
var arr3 : [Int]? =  nil



func getUsername() -> String? {
    "Taylor"
}

if let username = getUsername() {
    print("Username is \(username)")
} else {
    print("No username")
}



// -------- using guard let

// if let only runs code if there is a value inside optional
// guard let only runs code if there is NOT a value isnide


func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}


var myVar: Int? = 3

func printSquare2(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

printSquare2(of: nil)
printSquare2(of: 51)

/*:
 Tip: You can use guard with any condition, including ones that don’t unwrap optionals. For example, you might use guard someArray.isEmpty else { return }.
 
 */
