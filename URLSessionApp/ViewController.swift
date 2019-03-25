//
//  ViewController.swift
//  URLSessionApp
//
//  Created by PugalMuni on 20/03/19.
//  Copyright © 2019 PugalMuni R. All rights reserved.
//

import UIKit

let apiService = WebserviceAPI()
class ViewController: UIViewController {

override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       }
    // Call API for GET Method
    @IBAction func callAPIGetMethod(_ sender: Any) {
        guard let webURL = URL(string: StringConstants.kWEBAPIGETMETHODURL) else {return}
        apiService.executeWebAPIWithGetMethod(executeURL: webURL) { (responseDict, error) in
            DispatchQueue.main.async {
                if let unwrappedError = error {
                    println(log: unwrappedError)
                }
                if let unWrappedData = responseDict {
                    println(log: "Response Data : \n \(unWrappedData)")
                }
            }
        }
    }
    
    // Call API for Post Method
    @IBAction func callAPIPostMethod(_ sender: Any) {
       // guard let webURL
        guard let webURL = URL(string: StringConstants.kWEBAPIPOSTMETHODURL) else {return}
        apiService.executeWebAPIWithPostMethod(executeURL: webURL) { (responseDict, error) in
            if let unwrappedError = error {
                println(log: unwrappedError)
            }
            if let unwrappedData = responseDict {
                println(log: "Response Data : \n \(unwrappedData)")
            }
        }
    }
}
