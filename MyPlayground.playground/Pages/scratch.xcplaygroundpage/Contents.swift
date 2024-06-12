//: [Previous](@previous)

import Foundation

    
//    var convertedValue: String {
//        guard let value = Double(inputValue) else { return "Invalid Input" }
//        return String(format: "%.2f", convert(value: value, from: selectedFromUnit, to: selectedToUnit, type: selectedConversionType))
//    }

struct Person {
    var name : String

}
    
var numbers : [Int] = []
let numbers2 = [Int]()
let numbers3 = Array<Int>()
var numbers4 = [13, 42, 67, 141]
numbers.append(21)
numbers.append(7)

numbers.append(contentsOf:[1,3]) // append the contents of an array
//equivalent to
numbers = numbers + [27, 81]
// and also equivalent to
numbers += [72,99]

var cities : [String] = []
let cities2 = [String]()
let cities3 = Array<String>()
cities += ["Los Angeles","Detroit","New York", "Seattle", "Boston"]
cities.removeLast()
for city in cities { print(city) } // uses closure
print ("-------")
cities.remove(at: 1)
for city in cities {print(city)}
print ("-------")
cities.insert("Atlanta", at:3)
for city in cities { print(city) }

print ("-------")
for index in cities.indices { print(index)}

for index in numbers.indices {
    print (numbers[index])
}

print ("-------")


// for the tuple, returns a sequence of pairs
for (index, element) in numbers.enumerated(){
    print("\(index): \(element)")
}

let people : [Person]
let people2 = [Person]()
let people3 = Array<Person>()
    




