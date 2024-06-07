/*:  [Previous](@previous)    [HOME](Introduction)          [Next](@next)
 
 # Closures and Sending Functions into Functions
 
 func generateNumber() -> Int {
     Int.random(in: 1...20)
 }
 
*/

import Foundation

/*:
 
 use sorted(), filter(), map()
 
 call one, then the other, then the other back to back without using temporary variables.
 
 Filter out any numbers that are even
 Sort the array in ascending order
 Map them to strings in the format “7 is a lucky number”
 Print the resulting array, one item per line
 
 
 Expected output:
 
 7 is a lucky number
 15 is a lucky number
 21 is a lucky number
 31 is a lucky number
 33 is a lucky number
 49 is a lucky number
 */

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]


luckyNumbers
    .sorted(by:<)
    .filter({ $0 % 2 == 1 })
    .map({String($0) + " is a lucky number"})
    .forEach { print($0) }

//luckyNumbers
//    .filter { $0.isMultiple(of: 2) }
//    .sorted() { return $0 < $1 }
//    .map { ("\($0) is the lucky number") }
//    .forEach { print($0) }

/*:
 Solution:
 You need to use the filter(), sorted(), and map() functions.
 The order you run the functions matters – if you convert the array to a string first, sorted() will do a string sort rather than an integer sort. That means 15 will come before 7, because Swift will compare the “1” in “15” against “7”.
 To chain these functions, use luckyNumbers.first { }.second { }, obviously putting the real function calls in there.
 You should use isMultiple(of:) to remove even numbers.
 

 Example from Stack Overflow
 https://stackoverflow.com/questions/71048136/how-can-i-chain-functions-when-i-call-it-in-swift
 
 */
print("___________Example from Stack Overflow________")

// let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// by declaring it this way, you need to pass in a function
// first takes an int array and returns an int array
// second takes an int array and returns an int array
// third takes an int array and returns a string array

// func animate(duration: Double, animations: () -> Void) {
func doImportantWorkChain ( inputNumArray: [Int],
    first: ([Int]) -> [Int],
    second: ([Int]) -> [Int],
    third: ([Int]) -> [String]
) {
    let first_result = first(inputNumArray)
    let second_result = second(first_result)
    let third_result = third(second_result)

    for result in third_result {
      print(result)
    }
 }

// > They keyword 'in' marks the end of the params (input/return) and the start of the closure
/*:
 let sayHello3 = { (name: String) -> String in
     "Hi \(name)!"
 }
 print (sayHello3("Jenn"))
 
 number is the input param
 */
doImportantWorkChain(inputNumArray:luckyNumbers) { number in
      return number.filter {
          return $0.isMultiple(of: 2)
      }
} second: { number in
      return number.sorted {
          return $0 < $1
      }
} third: { number in
      return number.map {
         ("\($0) is the lucky number!")
      }
}



//func deliverTalk(name: String, type: () -> Void) {
//    print("My talk is called \(name)")
//    type()
//}
//deliverTalk(name: "My Awesome Talk", type: awesomeTalk)
