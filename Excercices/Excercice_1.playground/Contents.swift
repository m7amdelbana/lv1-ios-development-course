import Foundation

/*
1. Write a swift function take 2 integer numbers and return the largest of them. (if, or Inline if)

2. Write a swift function take first name and last name and return full name. (+, or one string)

3. Write a swift function take an array and return
1: if it contains values,
0: if it empty,
nil: if it nil. (if, or switch, guard, if let)
*/


// MARK: Problem 1

func largestNumber(num1: Int, num2: Int) -> Int {
    if num1 > num2 {
        return num1
    }
    return num2
}

func largestNumber(num1: Int, num2: Int) -> Int {
    // Condition ? [True] : [False]
    return num1 > num2 ? num1 : num2
}

var number = largestNumber(num1: 14, num2: 13)
print(number)



// MARK: Problem 2

func getFullName(_ firstName: String, _ lastName: String) -> String {
    return firstName + " " + lastName
}

func getFullName(firstName: String, lastName: String) -> String {
    return "Full name is \(firstName) \(lastName)"
}

print(getFullName(firstName: "Mohamed", lastName: "Khaled"))



// MARK: Problem 3

func validate(array: [Int]?) -> Int? {
    if array == nil {
        return nil
    } else if array?.isEmpty ?? true {
        return 0
    } else {
        return 1
    }
}

func validate(array: [Int]?) -> Int? {
    if array == nil {
        return nil
    }
    switch array?.count {
    case 0:
        return 0
    default:
        return 1
    }
}

func validate(array: [Int]?) -> Int? {
    if let array {
        switch array.count {
        case 0:
            return 0
        default:
            return 1
        }
    }
    return nil
}

func validate(array: [Int]?) -> Int? {
    if let array {
        return array.isEmpty ? 0 : 1
    }
    return nil
}

func validate(array: [Int]?) -> Int? {
    guard let array else { return nil }
    return array.isEmpty ? 0 : 1
}

print(validate(array: nil))
print(validate(array: []) ?? 0)
print(validate(array: [12, 13]) ?? 0)
