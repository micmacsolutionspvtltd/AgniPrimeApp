//
//  RequestGenerator.swift
//  Fustionkitchen
//
//  Created by Macintosh HDD on 05/10/21.
//  Copyright © 2021 fusionpos. All rights reserved.
//

import UIKit

class RequestGenerator: NSObject {
    static let sharedInstance = RequestGenerator()
    func generateURLRequest(urlValue: String, sendMethod : String? = "post", addionalHeader : [String: String]? = nil, requestBody: [String:Any]? = nil) throws -> URLRequest {
        print("URL = ",urlValue)
        var requestBodyValue:Data? = nil
        print("Parameter = ",requestBody ?? ["":""])
        if let requestBodyVal = requestBody {
            let json = try JSONSerialization.data(withJSONObject: requestBodyVal, options: [])
            requestBodyValue = json
        }
     
        var urlRequest = URLRequest(url: ((URL(string : urlValue) ?? URL(string: "https"))!))
       // urlRequest.httpBody = requestBodyValue
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        if let addionalHeaders = addionalHeader {
            for header in addionalHeaders{
                urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        if sendMethod == "post"{
            urlRequest.httpMethod = "post"
        }else{
            urlRequest.httpMethod = "get"
        }
       // urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        return urlRequest
    }
    
    
    func generateURLRequestQueryItem(urlValue: String, requestBody: [String:String]? = [:],queryItem:[URLQueryItem]? = []) throws -> URLRequest {
            print("URL = ",urlValue)
            var requestBodyValue:[URLQueryItem] = []
            print("Parameter = ",requestBody ?? ["":""])
            if let requestBodyVal = requestBody {
                for value in requestBodyVal {
                    requestBodyValue.append(URLQueryItem(name: value.key, value: value.value))
                }

            }
            print(requestBodyValue)
           var urlComponents = URLComponents(string: urlValue)
            urlComponents?.queryItems = requestBodyValue
         
            var urlRequest = URLRequest(url: urlComponents!.url!)
          

    //        urlRequest.httpBody = requestBodyValue
            urlRequest.setValue("text/html; charset=UTF-8", forHTTPHeaderField: "Content-Type")
            
            urlRequest.httpMethod = "post"
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
            return urlRequest
        }
    
    
}
