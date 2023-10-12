import Foundation

// MARK: - Loops - : Repeat code (for, while, repeat white)

let array = [1,2,3,4,5,6]
let arrayString = ["Item 1","Item 2","Item 3"]

// ...
print(array[0])
print(array[1])
print(array[2])
print(array[3])
print(array[4])
print(array[5])
// ...


// MARK: OLD

// FORMAT: for (int i = 0; i < array.lenght; i++) {
//                print(array[i])
//             }



// MARK: New: forEach

array.forEach { item in
    print(item)
}

arrayString.forEach { item in
    print(item)
}

array.indices.forEach { i in
    print(array[i])
}

arrayString.indices.forEach { i in
    print(arrayString[i])
}



// MARK: New: for

for i in 0...4 {
    print(i)
}

for i in 0..<array.count {
    print(array[i])
}

for i in 0...array.count - 1 {
    print(array[i])
}

for item in array {
    print(item)
}



// MARK: while

var condition = true
var i = 10

// <, >, <=, >=, ==, !=

while i > 0 {
    print("This print inside while: i = \(i)")
    i -= 1
}



// MARK: repeat while

var condition = false

repeat {
    print("This print inside repeat while")
} while condition

repeat {
    print("This print inside repeat while, i = \(i)")
    i += 1
} while i < 5




// MARK: struct, class

typealias StudentDic = [String:String]

let student1: StudentDic = [

    "id": "194688946",
    "name": "Mohamed",
    "grede": "Grade 10",
    "schoolSystem": "International"
]



// struct

struct Student {

    var id: Int?
    var name: String?
    var grade: String?

    init(id: Int? = nil, name: String? = nil, grade: String? = nil) {
        self.id = id
        self.name = name
        self.grade = grade
    }
}

var student1: Student = Student(id: 1, name: "Mohamed", grade: "12")
student1.id = 1
print(student1.id ?? 0)
print(student1.name ?? "")
print(student1.grade ?? "")


struct Student {

    var id: Int?
    var name: String?
    var grade: String?

    init(id: Int? = nil, name: String? = nil, grade: String? = nil) {
        self.id = id
        self.name = name
        self.grade = grade
    }
}


var student1: Student = Student(id: 1, name: "Mohamed", grade: "12")
print(student1)
student1.id = 1
print(student1.id ?? 0)
print(student1.name ?? "")
print(student1.grade ?? "")


struct Student {

    var id: String?
    var name: String?
    var grade: Int?

    init(id: String? = nil, name: String? = nil, grade: Int? = nil) {
        self.id = id
        self.name = name
        self.grade = grade
    }

    func printDetails() {
        print(id ?? 0)
        print(name ?? "")
        print(grade ?? "")
    }
}


var student1: Student = Student(id: 1, name: "Mohamed", "12")
student1.printDetails()


struct Student {

    var id: String
    var name: String
    var grade: Int

    func printDetails() {
        print(id)
        print(name)
        print(grade)
    }

    mutating func updateGrade(newGrade: Int) {
        grade = newGrade
    }
}

var student1: Student = Student(id: "Id", name: "Name", grade: 12)

func levelUpGrade(student: Student) -> Student {
    var newStudent = student
    newStudent.grade += 1
    return newStudent
}

print(student1)
print(levelUpGrade(student: student1))
print(student1)


class Student {

    var id: String
    var name: String
    var grade: Int

    init(id: String, name: String, grade: Int) {
        self.id = id
        self.name = name
        self.grade = grade
    }

    func printDetails() {
        print(id)
        print(name)
        print(grade)
    }

    func updateGrade(newGrade: Int) {
        grade = newGrade
    }
}

var student1: Student = Student(id: "Id", name: "Name", grade: 12)

func levelUpGrade(student: Student) -> Student {
    var newStudent = student
    newStudent.grade += 1
    return newStudent
}

// print(student1.grade)
// print(levelUpGrade(student: student1).grade)
// print(student1.grade)

print(student1)
print(levelUpGrade(student: student1))
print(student1)

struct Student {

    var id: String
    var name: String
    var grade: Int
}

var student1: Student = Student(id: "35745", name: "Mohamed", grade: 12)

var student2: Student = student1
student2.grade = 13

print(student1.grade)
print(student2.grade)



// MARK: class

class Student {

    var id: String
    var name: String
    var grade: Int

    init(id: String, name: String, grade: Int) {
        self.id = id
        self.name = name
        self.grade = grade
    }
}

var student1: Student = Student(id: "35745", name: "Mohamed", grade: 12)

var student2: Student = student1
student2.grade = 13

print(student1.grade)
print(student2.grade)

var student1: Student = Student(id: "35745", name: "Mohamed", grade: 12)

var student2: Student = Student(id: "35745", name: "Mohamed", grade: 12)

student2 = student1
student2.grade = 13

print(student1.grade)
print(student2.grade)



// MARK: Inheretance

class Person {

    var id: String = ""
    var name: String = ""

    func printDetails() {
        print("Id is: \(id), Name is: \(name)")
    }
}

class Person2: Person {

    var id: String = ""
    var name: String = ""

    func printDetails() {
        print("Id is: \(id), Name is: \(name)")
    }
}

class Student: Person2  {

    var grade: Int = 0
}

var student1: Student = Student()
student1.

class Person {

    var id: String
    var name: String

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }

    func printDetails() {
        print("Id is: \(id), Name is: \(name)")
    }
}

class Student: Person {

    var grade: Int = 0
}

var student1: Student = Student(id: "948549", name: "Name")
student1.printDetails()

class Person {

    var id: String
    var name: String

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }

    func printDetails() {
        print("Id is: \(id), Name is: \(name)")
    }
}

class Student: Person {

    var grade: Int

    init(id: String, name: String, grade: Int) {
        self.grade = grade
        super.init(id: id, name: name)
    }

    override func printDetails() {
        print("Id is: \(id), Name is: \(name), Grade is: \(grade)")
    }

}

var student1: Student = Student(id: "4857846", name: "jdfhdj", grade: 12)
student1.printDetails()



// MARK: Extension

var keyword: String = "Hello swift"
print(keyword.count)

func printCount(keyword: String) {
    print("The count is: \(keyword.count)")
}

printCount(keyword: keyword)
print("Hello swift".count)


extension String {
    
    func printCount() {
        print("The count is: \(self.count)")
    }
}

"Hello swift".printCount()

var key = """
<DOCTYPE>

<>

<>
"""

print(key)
