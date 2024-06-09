/*:  [Previous](@previous)    [HOME](Introduction)          [Next](@next)
 
 This section includes Functions Params and Return Vals
 
 * throwing functions (see Error Handling)
*/

import Foundation


func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
    
    let number = 139

    if number.isMultiple(of: 2) {
        print("Even")
    } else {
        print("Odd")
    }
}

let roll = Int.random(in: 1...20)

showWelcome()

//: another

// number and end are input params
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

// number and end are arguments, ie, the values
printTimesTables(number: 5, end: 20)


// return values

let root = sqrt(169)
print(root)

/*:
 
 If you want to return your own value from a function, you need to do two things:

 (1) Write an arrow then a data type before your function’s opening brace, which tells Swift what kind of data will get sent back.
 (2) Use the return keyword to send back your data.
 */

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)




func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}

/*:
 That code sorts both string1 and string2, assigning their sorted values to new constants, first and second. However, that isn’t needed – we can skip those temporary constants and just compare the results of sorted() directly, like this:
 */
func areLettersIdentical2(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

// we can do better!
/*:
 we’ve told Swift that this function must return a Boolean, and because there’s only one line of code in the function Swift knows that’s the one that must return data. Because of this, when a function has only one line of code, we can remove the return keyword entirely, like this:
 */
// Less intuitive IMHO

func areLettersIdentical3(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}


// long
func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)


// short!

func pythagoras2(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

// Returning MULTIPLE values from Functions!

/*:
 If you want to return two or more values from a function, you could use an array. For example, here’s one that sends back a user’s details:
 */


func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])")


// We could use a dictionary instead, but that has its own problems:



// Here’s how our function looks when it returns a tuple:

func getMyUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user1 = getMyUser()
print("Name: \(user1.firstName) \(user1.lastName)")

/*:
 or:
 
 func getUser() -> (firstName: String, lastName: String) {
     ("Taylor", "Swift")
 }
 
 */



// or

func getUser2() -> (String, String) {
    ("Taylor", "Swift")
}

let user3 = getUser2()
print("Name: \(user3.0) \(user3.1)")


/*:
 
 func getUser() -> (firstName: String, lastName: String) {
     (firstName: "Taylor", lastName: "Swift")
 }

 let user = getUser()
 let firstName = user.firstName
 let lastName = user.lastName

 print("Name: \(firstName) \(lastName)")
 
 */


// let (fName, lName) = getUser2()
// print("Name: \(fName) \(lName)")

// let (firstName, _) = getUser()
// print("Name: \(firstName)")




func rollDice(sides: Int, count: Int) -> [Int] {
    // Start with an empty array
    var rolls = [Int]()

    // Roll as many dice as needed
    for _ in 1...count {
        // Add each result to our array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }

    // Send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)




func isUppercase1(string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result1 = isUppercase1(string: string)


// If we add an underscore before the parameter name, we can remove the external parameter label like so:

func isUppercase2(_ string: String) -> Bool {
    string == string.uppercased()
}

let string2 = "HELLO, WORLD"
let result2 = isUppercase2(string2)




/*:
 For the next example, there are three things in there you need to look at closely:

 We write for number: Int: the external name is for, the internal name is number, and it’s of type Int.
 When we call the function we use the external name for the parameter: printTimesTables(for: 5).
 Inside the function we use the internal name for the parameter: print("\(i) x \(number) is \(i * number)").
 */
func printTimesTablesAgain(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTablesAgain(for: 5)


/*:
 So, Swift gives us two important ways to control parameter names: we can use _ for the external parameter name so that it doesn’t get used, or add a second name there so that we have both external and internal parameter names.
 
 */
