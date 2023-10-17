//
//  ViewController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 17/10/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let array = [1,2,2,45,6,6]
//
//        array.forEach { item in
//            print(array)
//        }
//
//        array.filter { <#Int#> in
//            <#code#>
//        }
//
//        array.sort { <#Int#>, <#Int#> in
//            <#code#>
//        }
//
////
//        calculate(num1: 5, num2: 2) {
//            print("Closure")
//        }
        
        calculate(num1: 10, num2: 5) { i in
            print(i)
        } sub: { i in
            print(i)
        } mul: { i in
            print(i)
        } div: { i in
            print(i)
        }
        
        print("Closure")
        print("Closure")
        print("Closure")
        print("Closure")

    }
    
    func calculate(num1: Double, num2: Double,
                   sum: @escaping (Double) -> (),
                   sub: @escaping (Double) -> (),
                   mul: @escaping (Double) -> (),
                   div: @escaping  (Double) -> ()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            sum(num1 + num2)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            sub(num1 - num2)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            mul(num1 * num2)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            div(num1 / num2)
        }
    }
}

