//
//  ViewController.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 19/02/2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let endpint = Endpoint(path: Constants.EndpointPath.categories,
                               method: .get)
        
        NetworkManager().request(type: Page<Category>.self, of: endpint) { response in
            switch response {
            case .onSuccess:
                print("onSuccess")
            case let .onFailure(error):
                print("onFailure: \(error)")
            }
        }
    }
}

