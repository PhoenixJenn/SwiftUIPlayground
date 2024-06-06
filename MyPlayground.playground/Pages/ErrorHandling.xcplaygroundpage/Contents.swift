/*:  [Previous](@previous)    [HOME](Introduction)          [Next](@next)
 
 # Error Handling 101
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

constructBuilding(floors: 13)
