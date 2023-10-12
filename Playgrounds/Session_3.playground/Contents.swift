import Foundation

// MARK: - Define multiple variables at single line -

let example1 = {
    var x, y, z: String?
}



// MARK: - Int and UInt Data types -

let example2 = {
    
    // Int8, Int16, Int32, Int64 (Int)
    // UInt8, UInt16, UInt32, UInt64 (UInt)
    
    var x1: UInt16 = 7676
    print(x1)
}



// MARK: - Control flow (if, switch) -

let example3 = {
    
    // Conditions: >, <, >=, <=, ==, !=
    
    // if (condition) {
    
    // } else {
    
    // }
    
    let x  = 10
    
    if x >= 10 {
        print("x is more than 10")
    } else if  x > 5 {
        print("x is more than 5")
    } else {
        print("Don't know")
    }
    
    if x >= 10 {
        print("x is more than 10")
    }
    
    print("Contine")
    
    var word = "Hello"
    
    // If
    
    if word.count == 5 {
        print("5")
    } else if word.count == 4 {
        print("4")
    } else {
        print("else")
    }
    
    // Switch
    
    switch word.count {
    case 5:
        print("5")
    case 4:
        print("4")
    case 1, 2, 3:
        print("Less than 4")
    default:
        print("default")
    }
}



// MARK: - Functions -

let example4 = {
    
    var x = 12
    var y = 12
    
    var z = x + y
    print("The sum of x and y is z = \(z)")
    
    // Functions/Methods: Block of code in: paramters (data) -> Out
    // Function: paramters (x,y) -> Out (x + y)
    // Data type of paramters: Int
    // Data type of Output: Int
    
    /// Create function to calculate the sum of 2 numbers
    
    // Example 1
    
    func sum(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
    
    let number1 = sum(num1: 5, num2: 10)
    print("Sum = \(number1)")
    
    // Example 2
    
    func sum(_ num1: Int, _ num2: Int) -> Int {
        let num3 = num1 + num2
        print("Sum = \(num3)")
        return num3
    }
    
    let number2 = sum(5, 10)
    print("Sum = \(number2)")
    
    // Example 3
    
    func sum(number x: Int, plus y: Int) -> Int {
        return x + y
    }
    
    let number3 = sum(number: 5, plus: 10)
    print("Sum = \(number3)")
    
    // Example 4: Function without return value
    // Can be empty
    // Can be -> Void
    // Can be -> ()
    
    func printNumber(number: Int) {
        print("The number is \(number)")
    }
    
    /*
     func printNumber(number: Int) -> Void {
     print("The number is \(number)")
     }
     
     func printNumber(number: Int) -> () {
     print("The number is \(number)")
     }
     */
    
    printNumber(number: 10)
}



// MARK: - Functions when default paramter values -

let example5 = {
    
    func sum(_ number1: Int = 0, _ number2: Int = 0) -> Int {
        return number1 + number2
    }
    
    func sum(number1: Int? = nil, number2: Int? = nil) -> Int {
        if let number1, let number2 {
            return number1 + number2
        }
        return 0
    }
}



// MARK: - if let & guard -

let example6 = {
    
    // Normal if way
    
    func sum(_ number1: Int? = nil, _ number2: Int? = nil) -> Int {
        if number1 != nil && number2 != nil {
            return (number1 ?? 0) + (number2 ?? 0)
        }
        return 0
    }
    
    // if let
    
    var x: Double? = 10
    var y: Double? = 3
    
    if let x, let y, y > 0 {
        var z = x / y
        print(z)
    }
    
    var keyword: String? = "Hello Swift!"
    
    if let keyword {
        print("The keyword is \(keyword)")
    }
    
    func sum(number1: Double? = nil, number2: Double? = nil) -> Double {
        if let number1, let number2 {
            return number1 + number2
        }
        return 0
    }
    
    // guard
    
    func sum(number1: Int? = nil, number2: Int? = nil) -> Int {
        guard let number1 else { return 0 }
        guard let number2 else { return 1 }
        return number1 + number2
    }
}



// MARK: - Overload -

// Overload happen when have the same function
// but with different paramters data type, paramters quantity or return value.

let example7 = {
    
    func sum(number1: Int, number2: Int) -> Int {
        return number1 + number2
    }
    
    func sum(number1: Int, number2: Int) -> Double {
        return Double(number1) + Double(number2)
    }
    
    let x1: Int = sum(number1: 10, number2: 6)
    let y1: Double = sum(number1: 10, number2: 20)
    
    print("Sum = \(x1)")
    print("Sum = \(y1)")
    
    func sum(number1: Int, number2: Int, number3: Int) -> Int {
        return number1 + number2 + number3
    }
    
    print("Sum = \(sum(number1: 10, number2: 20))")
    print("Sum = \(sum(number1: 10, number2: 20, number3: 30))")
    
    func sum(_ number1: Int, _ number2: Int) -> Int {
        return number1 + number2
    }
    
    func sum(number3: Int, _ number4: Int) -> Int {
        return number3 + number4
    }
    
    func sum(number1: Double, number2: Double) -> Double {
        return number1 + number2
    }
    
    let x2: Int = sum(number3: 10, 6)
    let y2: Double = sum(number1: 10.0, number2: 20.0)
    
    print("Sum = \(x2)")
    print("Sum = \(y2)")
}



// MARK: - defer -

let example8 = {
    
    func printOuput() {
        print("The sum function has been ended")
    }
    
    func sum(number1: Double, number2: Double) -> Double {
        defer { printOuput() }
        let theSum = number1 + number2
        print("The number is \(theSum)")
        return theSum
    }
    
    sum(number1: 20.0, number2: 30.5)
}



// MARK: - typealias -

let example9 = {
    
    // Student [id, name, grade]
    
    typealias Student = [String:Any]
    
    typealias UnsignedInt = UInt32
    let x: UnsignedInt = 5867
    
    typealias NetworkHeaders = [String:String?]
    typealias NetworkParamters = [String:Any]
    
    let student1: Student = [
        "id": 857375,
        "name": "Mohamed",
        "grade": "Grade 12"
    ]
    
    let student2: Student = [
        "id": 857375,
        "name": "Mohamed",
        "grade": "Grade 12"
    ]
    
    print(student1)
    print(student2)
}
