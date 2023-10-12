import Foundation


// MARK: Computed variable

struct Student {
    
    var firstName: String
    var lastName: String
    var fullName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = "\(firstName) \(lastName)"
    }
}

var student1 = Student(firstName: "Mohamed", lastName: "Khaled")
print(student1)
student1.firstName = "M."
print(student1)
print(student1.fullName)

struct Student {
    
    var firstName: String?
    var lastName: String?
    
    var fullName: String {
        let names = "\(firstName ?? "") \(lastName ?? "")"
        return names
    }
}

var student1 = Student(firstName: "Mohamed", lastName: "Khaled")
print(student1)
print(student1.fullName)
student1.firstName = "M."
print(student1)
print(student1.fullName)




// MARK: Enum

// E-commerce: Orders
// pending, canceled, inProgress, completed

class Order {
    
    var id: String = ""
    var status: String = ""
}

let order1 = Order()
order1.id = "#85968"
order1.status = "pending"

print(order1.status)

func updateOrderStatus(order: Order, newStatus: String) {
    order.status = newStatus
}

updateOrderStatus(order: order1, newStatus: "inPogres")
print(order1.status)

enum OrderStatus {
    
    case pending
    case canceled
    case inProgress
    case completed
}

class Order {
    
    var id: String = ""
    var status: OrderStatus = .pending
}

let order1 = Order()
order1.id = "#85968"
order1.status = .pending

print(order1.status)

func updateOrderStatus(order: Order, newStatus: OrderStatus) {
    order.status = newStatus
}

updateOrderStatus(order: order1, newStatus: .inProgress)

print(order1.status)

enum OrderStatus: String {
    
    case pending = "Pending"
    case canceled = "Canceled"
    case inProgress = "InProgress"
    case completed = "Completed"
}

class Order {
    
    var id: String = ""
    var status: OrderStatus = .pending
}

let order1 = Order()
order1.id = "#85968"
order1.status = .pending

print(order1.status)

func updateOrderStatus(order: Order, newStatus: OrderStatus) {
    order.status = newStatus
}

updateOrderStatus(order: order1, newStatus: .inProgress)

print(order1.status)

func sendOrderStatusToServer(order: Order) -> String {
    switch order.status {
    case .pending:
        return ""
    case .canceled:
        return ""
    case .inProgress:
        return ""
    case .completed:
        return ""
    }
}

func sendOrderStatusToServer(order: Order) -> String {
    return order.status.rawValue
}


func sendOrderStatusToServer(order: Order) -> OrderStatus {
    return order.status
}

print(sendOrderStatusToServer(order: order1))




// MARK: Protocol, interface

protocol Engine {
    func startEngine()
}

class Vechile {
    
    func move() {
        
    }
    
    func stop() {
        
    }
}

class Car: Vechile, Engine {
    
    var model: String?
    
    func startEngine() {
        print("Cart start")
    }
}

class Motor: Vechile, Engine {
    
    var model: String?
    
    func startEngine() {
        print("Motor start")
    }
}

class Bycle: Vechile {
    
    var model: String?
}

var car1 = Car()
car1.model = "BMW"
car1.startEngine()

var car2 = Car()
car2.model = "Opel"
car2.startEngine()

var motor1 = Motor()
motor1.model = "BMW"
motor1.startEngine()

var bycle1 = Bycle()
bycle1.model = "B1"




// MARK: set, get, didSet, willSet

class Car: Vechile, Engine {
    
    var model: String = "" {
        didSet {
            print("Model: \(model)")
        }
        willSet {
            print("Model: \(model)")
        }
    }
    
    func startEngine() {
        print("Cart start")
    }
}

var car1 = Car()
car1.model = "BMW"
print(car1.model)
car1.startEngine()
car1.model = "Opel"
car1.model = "BMW"




// MARK: Access Control

// Access modifiers
// private, [default: internal], public, open, fileprivate

// Access specfiers
// static, final

class Order {
    
    var id: String = ""
    var status: String = ""
    
    var price: Double = 0.0 {
        didSet { addTax() }
    }
    
    var totalPrice: Double = 0.0
    
    func addTax() {
        totalPrice += price + 14.0
    }
    
    func changeStatus(newStatus: String) {
        status = newStatus
    }
}

let order1 = Order()
order1.id = "#948695"
order1.changeStatus(newStatus: "Pending")
order1.price = 150.0

print(order1.totalPrice)





// MARK: macro

class Order {
    
    var id: String = ""
    var status: String = ""
    public private(set) var price: Double = 0.0
    
    static var ordersTotalPrice: Double = 0.0
    
    func updatePrice(price: Double) {
        if price >= 0 {
            self.price = price
        }
    }
    
    func calculatePromocode() {
#warning("calculatePromocode: To be implemented...")
    }
}

let order1 = Order()
order1.id = "#948695"
order1.status = "Pending"
order1.updatePrice(price: 150.0)


Order.ordersTotalPrice = 5000.0

print(Order.ordersTotalPrice)

extension String {
    
    static func printKeyword(_ keyword: String) {
        print(keyword)
    }
    
    var countOfElements: String {
        return "Elements: \(self.count)"
    }
}

print("Hello".countOfElements)




// MARK: generic

func findIndex<T:Vechile>(valueToFind: T, array: [T]) -> Int? {
    
}




// MARK: Tuples

var value: Double?
var termpresureUnit: String?

func termpresure(temp: (value: Double, unit: String)) -> (value: Double, unit: String) {
    return (value: temp.0 * 1.9, unit: "F")
}

func termpresure(temp: (value: Double, unit: String)) -> (value: Double, unit: String) {
    return (value: temp.value * 1.9, unit: "F")
}

print(termpresure(temp: (value: 39, unit: "C")))




// MARK: mutating

struct Person {
    
    var name: String
    
    mutating func setName(name: String) {
        self.name = name
    }
}

var person1 = Person(name: "Mohamed")
print(person1.name)
person1.setName(name: "Mo")
print(person1.name)

var persons = [Person]()
