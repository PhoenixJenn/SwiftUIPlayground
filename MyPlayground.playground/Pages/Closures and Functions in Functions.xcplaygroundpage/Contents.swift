/*:  [Previous](@previous)    [HOME](Introduction)          [Next](@next)
 
 # Closures and Sending Functions into Functions
*/

import Foundation
// day 9 https://www.hackingwithswift.com/100/swiftui
// https://www.hackingwithswift.com/100/swiftui/9


// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-and-use-closures


/*:
 ## CLOSURES
 
 Why Closures?
 (1) Running some code after a delay.\
 (2) Running some code after an animation has finished.\
 (3) Running some code when a download has finished.\
 (4) Running some code when a user has selected an option from your menu.\
 
 You can assign functions to variables, pass functions into functions, and even return functions from functions.

 Important: When you’re copying a function, you don’t write the parentheses after it. If you put the parentheses there you are calling the function and assigning its return value back to something else. \
 
> it’s var greetCopy = greetUser and not var greetCopy = greetUser()
 
 
 The following creates a function and calls it, but then creates a copy of that function and calls the copy. As a result, it will print the same message twice.
 */

func greetUser() {
    print("Greet User: Hi there!")
}

greetUser()

var greetCopyFunction = greetUser
greetCopyFunction()



greetUser()

var greetCopy777: () -> Void = greetUser
greetCopy777()


/*:
## QUICK CLOSURE ASSIGNMENT
 
 If you want to skip creating a separate function, and just assign the functionality directly to a constant or variable.\
 This is called a closure expression, – a bit of code we can pass around and call whenever we want. This one doesn’t have a name, but otherwise it’s effectively a function that takes no parameters and doesn’t return a value.
 */


let sayHello2 = {
    print("Say Hello 2: Hi there!")
}

sayHello2()

/*:

 ## ACCEPTING PARAMETERS
 
 If you want the closure to accept parameters, they need to be written in a special way. You see, the closure starts and ends with the braces, which means we can’t put code outside those braces to control parameters or return value. So, Swift has a neat workaround: we can put that same information inside the braces, like this:
 
    > They keyword 'in' marks the end of the params (input/return) and the start of the closure
 */


let sayHello3 = { (name: String) -> String in
    "Hi \(name)!"
}

//sayHello3("Taylor")
print (sayHello3("Taylor"))
print("---------")
/*:
 
 (1) The empty parentheses marks a function that takes no parameters.\
 (2)The arrow means just what it means when creating a function: we’re about to declare the return type for the function.\
(3)  Void means “nothing” – this function returns nothing. Sometimes you might see this written as (), but we usually avoid that because it can be confused with the empty parameter list.
 */
print("---------")
func greetTheUser() {
    print("Greet The User: Hi there!")
}
/*:
 THIS!  : () -> Void =
 
 (1) Empty Parens() marks a function that returns no params\
 (2) arrow, means we are about to declare return type\
 (3) void - means it returns no value. Void and Open/Close Parens means the same thing.\
 
 ------------------------------
 */


var greetTheUserCopy: () -> Void = greetTheUser





/*:
 Every function’s type depends on the data it receives and sends back. That might sound simple, but it hides an important catch: the names of the data it receives are not part of the function’s type.
 
The following is a function that accepts an integer and returns a string.
 */

//  -> means returns .. String (in this case)
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}
print("--- print getUserData for 1989 ---")
print(getUserData(for: 1989))

// let data is a function that takes an int and returns a string
// equals getUserData ... no parens because we don't want to RUN getUserData
let data: (Int) -> String = getUserData
let user = data(1989)
print(user)


/*:
 when we take a copy of the function the type of function doesn’t include the for external parameter name, so when the copy is called we use data(1989) rather than data(for: 1989).
 */



/*:
 To return a val from a closure without any input params, use empty parens
 
 */
let payment = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

// this just returns true or false
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}
// ----------------------
// since sorted EXPECTS the input of 2 strings and returns a bool, we can write;

let captainFTeam = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

/*:
 Rather than passing the closure in as a parameter to team.sorted(by: xxx) , we just go ahead and start the closure directly – and in doing so remove (by: from the start, and a closing parenthesis at the end.
 
 Swift can also shorthand the input params
 
 let captainFirstTeam = team.sorted {
     if $0 == "Suzanne" {
         return true
     } else if $1 == "Suzanne" {
         return false
     }

     return $0 < $1
 }
 
 EVEN SIMPLER::::
 
 
 let reverseTeam = team.sorted {
     return $0 > $1
 }
 
 
 Or even SIMPLER!!! -------->
 */
let reverseTeam = team.sorted { $0 > $1 }


print("t Only")
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

/*:
 the map() function lets us transform every item in the array using some code of our choosing, and sends back a new array of all the transformed items:
 */
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)


/*:
 So, if the first name is Suzanne, return true so that name1 is sorted before name2. On the other hand, if name2 is Suzanne, return false so that name1 is sorted after name2. If neither name is Suzanne, just use < to do a normal alphabetical sort.

 Like I said, sorted() can be passed a function to create a custom sort order, and as long as that function a) accepts two strings, and b) returns a Boolean, sorted() can use it.
 
 the .sorted function takes in a 'by: areInIncreasingOrder' param which is true/false based on 2 items being evaluated
 
 Complexity
 O(n log n), where n is the length of the sequence.

 https://developer.apple.com/documentation/swift/array/sorted(by:)
 Reordering an Array's Elements:
 The sort function's siblings are:
 .sorted()
 .reverse()
 .reversed()
 .shuffle
 .shuffle<T>(using: inout T)
 .shuffled
 .shuffled<t>(using: inout T) -> [Self.Element]
 .partition
 .swapAt
 
 
 */

print("--- print captainFirstTeam  ---")
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)


// an example using the default 'by'
let students: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
let descendingStudents = students.sorted(by: >)
print(descendingStudents)
// Prints "["Peter", "Kweku", "Kofi", "Akosua", "Abena"]"


    /*:
     
     Let’s start with a simple example first. Here’s a function that accepts a Double then a closure full of changes to make:
     
     
     
 
     ANIMATIONS() closure is an input param.
     
     */
func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
    print("Animation complete…")
}

animate(duration: 3, animations: {
    print("Fade out the image")
})

// simplified

print("-----------")

animate(duration: 3) {
    print("Fade out the image")
}

/*:
-----------------------------------------------------------
 make Array takes 2 inputs, a size integer and a Generator function
  this is the FUNCTION:    using generator: () -> Int
 
 No input params but returns integer
 
 Repeatedly call the generator function and add it to the array
 */

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}


// ----

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}
print("-----< Rolls > -----")

print(rolls)



// ----


func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)

print("---< New Rolls >-------")
print(newRolls)


// ---- This function calls functions
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}


/*:
 
 You can also write it like this, with 3 trailing closures;
 
 doImportantWork {
     print("This is the first work")
 } second: {
     print("This is the second work")
 } third: {
     print("This is the third work")
 }
 
 
 
 */



// Passing a valid closure into a function


let awesomeTalk = {
    print("Here's a great talk!")
}
func deliverTalk(name: String, type: () -> Void) {
    print("My talk is called \(name)")
    type()
}
deliverTalk(name: "My Awesome Talk", type: awesomeTalk)


// valid code:

let swanDive = {
    print("SWAN DIVE!")
}
func performDive(type dive: () -> Void) {
    print("I'm climbing up to the top")
    dive()
}
performDive(type: swanDive)


// valid swift

let helicopterTravel = {
    print("Get to the chopper!")
}
func travel(by travelMeans: () -> Void) {
    print("Let's go on vacation...")
    travelMeans()
}
travel(by: helicopterTravel)


//valid swift

let evilRobot = {
    print("EXTERMINATE")
}
func buildRobot(personality: () -> Void) {
    print("Time to turn on the robot!")
    personality()
}
buildRobot(personality: evilRobot)


// valid swift

var payCash = {
    print("Here's the money.")
}
func buyClothes(item: String, using payment: () -> Void) {
    print("I'll take this \(item).")
    payment()
}
buyClothes(item: "jacket", using: payCash)



// this is INCORRECT. It shoudl NOT return a string

let driveSafely = {
   // return "I'm being a considerate driver"
    print("I'm driving safely")
}
func drive(using driving: () -> Void) {
    print("Let's get in the car")
    driving()
    print("We're there!")
}
drive(using: driveSafely)
