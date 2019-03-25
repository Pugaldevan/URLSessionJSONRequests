//
//  WebserviceApi.swift
//  URLSessionApp
//
//  Created by PugalMuni on 20/03/19.
//  Copyright © 2019 PugalMuni R. All rights reserved.
//

import Foundation
class WebserviceAPI {
    // Web API for GET Method
    func executeWebAPIWithGetMethod(executeURL : URL, completionHandler: @escaping ([String : Any]?, Error?) -> Void) {
//        let webRequest = URLRequest(url: executeURL)
        let session = URLSession.shared
        session.dataTask(with: executeURL) { (responseData, urlResponse, apiError) in
            guard let unWrappedData = responseData else {
                completionHandler(nil,apiError)
                return
            }
            do {
                let jsonReponse = try JSONSerialization.jsonObject(with: unWrappedData, options: []) as? [String : Any]
               //  println(log: jsonReponse!
                completionHandler(jsonReponse, nil)
            }
            catch {
                println(log: error.localizedDescription)
                //  pass the full error instead of error description
                completionHandler(nil, error)
            }
        }.resume()
    }
    
    // Web API for POST Method
    func executeWebAPIWithPostMethod(executeURL : URL, completionHandler : @escaping ([String : Any]?, Error?) -> Void)
    {
        let session = URLSession.shared
       
        let parameters = ["userName":"John","password":"test123"]
        let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        var webRequest = URLRequest(url: executeURL)
        webRequest.httpMethod = "POST"
        webRequest.httpBody = httpBody
        webRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        session.dataTask(with: webRequest) { (responseData, urlResponse, apiError) in
            guard let unwrappedData = responseData else {
                completionHandler(nil,apiError)
                return
            }
                do {
                    let jsonReponse = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String : Any]
                    completionHandler(jsonReponse,nil)
                    //println(log: jsonObject)
                }catch {
                    println(log: error)
                    completionHandler(nil,apiError)
                }
            }.resume()
    }
}
