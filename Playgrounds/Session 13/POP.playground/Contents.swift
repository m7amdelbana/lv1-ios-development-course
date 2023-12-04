import UIKit

var greeting = "Hello, playground"

protocol Vechile {
    var wheelsNumber: Int { get }
    func start()
    func stop()
}

protocol Car: Vechile {
    func turnLight()
}

protocol EVVechile {
    func charge()
}

extension Vechile {
    
    func start() {
        print("Start...")
    }
}

typealias HybridCar = Car & EVVechile

struct PersonalCar: HybridCar {

    var wheelsNumber: Int {
        return 4
    }
    
    func stop() {
        print("Stop...")
    }
    
    func charge() {
        print("Charge...")
    }
    
    func turnLight() {
        
    }
}

struct Motor: Vechile {
    
    var wheelsNumber: Int {
        return 2
    }
    
    func stop() {
        print("Stop...")
    }
}

let car = PersonalCar()
car.start()

protocol LinkedListProtocol {
    
    associatedtype Element
    
    mutating func push(item: Element)
    mutating func pop() -> Element?
}

struct LinkedList<T>: LinkedListProtocol {

    private var items = [T]()
    
    mutating func push(item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T? {
        return items.popLast()
    }
}

let array = LinkedList<Double>()
