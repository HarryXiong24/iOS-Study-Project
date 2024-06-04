import UIKit

var greeting = "Hello, playground"

print(greeting)

print("2 + 3 = \(2+3)")

let a = 1

print(a)


let numbers = [45, 73, 195, 53]

//Write your code here
var temp: [Int] = [];

for i in 0...numbers.count-1 {
    if (i+1 >= numbers.count) {
        temp.append(numbers[i] * numbers[0])
    } else {
        temp.append(numbers[i] * numbers[i+1])
    }
}

let computedNumbers = temp

print(computedNumbers)


let arr = [Int.random(in: 0...10), Int.random(in: 0...10), Int.random(in: 0...10), Int.random(in: 0...10)]

print(arr)

if let randomElement = arr.randomElement() {
    print(randomElement)
} else {
    print("The array is empty.")
}
print(arr.shuffled())


let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

//The number of letters in alphabet equals 26
var s = "";
for i in 0..<6 {
    if let letter = alphabet.randomElement() {
        s += letter
    }
}

let password = s



print(password)
