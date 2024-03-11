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
        
        //        let endpint = Endpoint(path: Constants.EndpointPath.categories,
        //                               method: .get)
        //
        //        NetworkManager().request(type: Page<Category>.self, of: endpint) { response in
        //            switch response {
        //            case let .onSuccess(data):
        //                print("onSuccess")
        //            case let .onFailure(error):
        //                print("onFailure: \(error)")
        //            }
        //        }
        
        //        let endpint = Endpoint(path: Constants.EndpointPath.ads,
        //                               method: .get)
        //
        //        NetworkManager().request(type: Ignore.self, of: endpint) { response in
        //            switch response {
        //            case .onSuccess:
        //                print("onSuccess")
        //            case let .onFailure(error):
        //                print("onFailure: \(error)")
        //            }
        //        }
        
        //        let id = "6390ea83cd6b57303deaa6f2"
        //        let endpint = Endpoint(
        //            path: "\(Constants.EndpointPath.categories)/\(id)",
        //            method: .get)
        //
        //        NetworkManager().request(type: Category.self, of: endpint) { response in
        //            switch response {
        //            case let .onSuccess(data):
        //                print("onSuccess")
        //            case let .onFailure(error):
        //                print("onFailure: \(error)")
        //            }
        //        }
        
        //        let endpint = Endpoint(
        //            path: "\(Constants.EndpointPath.categories)?pageNumber=1&pageSize=10".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "",
        //            method: .get)
        //
        //        NetworkManager().request(type: Page<Category>.self, of: endpint) { response in
        //            switch response {
        //            case let .onSuccess(data):
        //                print("onSuccess")
        //            case let .onFailure(error):
        //                print("onFailure: \(error)")
        //            }
        //                }
        
        let repo = CategoriesRepo()
        
        repo.getAll(pageNumber: 1) { response in
            switch response {
            case let .onSuccess(data):
                print("onSuccess")
            case let .onFailure(error):
                print("onFailure: \(error)")
            }
        }
    }
}

