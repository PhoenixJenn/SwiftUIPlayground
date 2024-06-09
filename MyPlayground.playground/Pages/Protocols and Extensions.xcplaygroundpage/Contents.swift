/*:  [Previous](@previous)    [HOME](Introduction)          [Next](@next)
 
# Protocols and Extensions
 
 protocols can’t provide implementations for methods
 
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
