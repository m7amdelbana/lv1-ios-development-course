import Foundation

// MARK: - How to write comment on Swift -

/// 1. Single line
// This file will used to learn Swift!

/// 2. Multiple lines

/*
This file will used to learn Swift!
And practice on it.
*/



// MARK: - Variables vs. Constants -

// Variable (var), Constant (let)



// MARK: - Data types -

// Int -> (Int32, Int64),
// (Float, Double),
// Bool,
// Character, String,
// Array,
// Dictionary



// MARK: - Data types (Nullable) -

// Int? -> (Int32?, Int64?),
// (Float?, Double?),
// Bool?,
// Character?, String?,
// Array?,
// Dictionary?



// MARK: - How to print a value -

var variableToPrint: Int = 8
print(variableToPrint)



// MARK: - Print inside string -

var variableToPrint2: Int = 8
print("The value of x = \(variableToPrint2)")



// MARK: - Casting -

var xFloat: Float = 8.5
print("The value of x = \(xFloat)")

var xInt = 10
print("The value of x = \(xInt)")

var xInt2: Int = 8
print("The value of x = \(xInt2)")

xInt2 = Int(10.5)
print("The value of x = \(xInt2)")



// MARK: - Boolean data type -

var xBool: Bool = true
var yBool = false

var xBoolCheck = 10 > 20
print("The value of x = \(xBoolCheck)")



// MARK: - String & Character -

var xString: String = "String"
var yCharacter: Character = "A"

print("The value of x = \(xString)")
print("The value of y = \(yCharacter)")



// MARK: - Array -

var array: [Any] = [8, 9, 10, 11, 12.5, "A", 9898786, "String", [19, 12]]
print("The value of array = \(array)")
// print("The value of array index = \(array[20])") // Index out of range

var emptyArray = [Int]()

emptyArray.append(10)
emptyArray.append(11)

print("The value of x = \(emptyArray)")
print("The value of x = \(emptyArray.first ?? 0)") // Built in function
print("The value of x = \(emptyArray.last ?? 1)") // Built in function

print("The value of x = \(emptyArray[0])")
print("The value of x = \(emptyArray[1])")



// MARK: - Optional variables -

var xIntOptional: Int? = nil
var yIntOptional: Int = 10

yIntOptional = xIntOptional ?? 0
print("The value of y = \(yIntOptional)")

var xStringOptional: String? = nil
var yStringOptional: String = "Test"

yStringOptional = xStringOptional ?? "Value is nil"
print("The value of x = \(yStringOptional)")

var xArrayOptional: [Int]? = [1, 2, 3]
xArrayOptional = nil
print("The value of x = \(xArrayOptional ?? [1])")



// MARK: - Dictionary -

var dic: [String:String] = [
    "name": "Mohamed",
    "tool": "Xcode",
    "lang": "Swift"
]

print("The value of dic = \(dic["name"] ?? "")")
print("The value of dic = \(dic["tool"] ?? "")")
print("The value of dic = \(dic["lang"] ?? "")")



// MARK: - Math Operations -

var num1 = 10
var num2 = 23

var isNum1Even = num1 % 2 == 0
var isNum2Even = num2 % 2 == 0

print("The value of 1 = \(isNum1Even)")
print("The value of 2 = \(isNum2Even)")

var z = 10 + 20
z = 10 - 20
z = 20 / 30
z = 5 * 10
z = 20 % 10
print("The value of z = \(z)")

var num = 10
num += 1
print("The value of num = \(num)")
