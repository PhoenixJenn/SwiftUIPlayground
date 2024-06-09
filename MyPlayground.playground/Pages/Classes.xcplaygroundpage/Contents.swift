/*:  [Previous](@previous)    [HOME](Introduction)          [Next](@next)
 
 # Classes
 
 Unlike structs, classes support inheritance
 
 * using final (do not subclass)
 
 Properties of Classes that differentiate from structs:
 * structs require mutating to change variables, classes do not
 
(1)  You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.\
 (2) Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.\
 (3)When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.\
(4) When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.\
(5) Even if you make a class constant, you can still change its properties as long as they are variables\
 */

import Foundation

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

//

// final means nothing can inherit from it... this class is the final class
final class Image {
    var filename: String
    var isAnimated: Bool
    init(filename: String, isAnimated: Bool) {
        self.filename = filename
        self.isAnimated = isAnimated
    }
}

// ------ Theme park class with initialization
class ThemePark {
    var entryPrice: Int
    var rides: [String]
    init(rides: [String]) {
        self.rides = rides
        self.entryPrice = rides.count * 2
    }
}

// ------ Employee class with inheritance; Developer and Manager work ----

class Employee {
    let hours: Int
//    enum employeeTypes
//        case { manager, developer, hr}
//    }
//    let employeeType: employeeTypes
    //var style = UIStyle.light
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
    
    init(hours: Int) {
        self.hours = hours
    }
}


class Developer: Employee {
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}

class Manager: Employee {

    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
let novall = Developer(hours: 8)
print("---------")
novall.printSummary()

robert.work()
joseph.work()



/*:
 # Initializing Classes
 */


class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}


// need to set base class member variabl3s

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

    let teslaX = Car(isElectric: true, isConvertible: false)


// COPIES ->classes are reference types not value types. so when you say user1 = user2, that means it is the same object

class User {
    var username = "Anonymous"
    let id: Int

        init(id: Int) {
            self.id = id
            print("User \(id): I'm alive!")
        }

        deinit {
            print("User \(id): I'm dead!")
        }
    // can add a copy function that instantiates a new object
    func copy() -> User {
        let user = User(id:id)
            user.username = username
            //self.id = id
            return user
        }
}
var user1 = User(id:7)
print("---------")
var user2 = user1
user2.username = "Taylor"

print(user1.username)
print("---------")

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

print("---------")
var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}
print("---------")
print("Loop is finished!")
users.removeAll()
print("Array is clear!")


// ---------Pizza Class----------

class Pizza {
    private var toppings = [String]()
    func add(topping: String) {
        toppings.append(topping)
    }
}
var pizza = Pizza()
pizza.add(topping: "Mushrooms")
