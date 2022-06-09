//
//  NetworkService.swift
//  StarterPack
//
//  Created by Ilham Hadi Prabawa on 11/03/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//

import Foundation
import Alamofire

public class NetworkService: Service {
    
  public init() {}
  
  public func request<T: Codable>(of type: T.Type,
                           with url: String,
                           withMethod method: HTTPMethod? = .get,
                           withHeaders headers: HTTPHeaders = [:],
                           withParameter parameters: Parameters = [:],
                           withEncoding encoding: ParameterEncoding? = URLEncoding.default,
                           completion: @escaping(Result<T, ErrorMessage>) -> Void) {
    
    //Headers
    var localHeaders: HTTPHeaders = ["": ""]
    
    if !headers.isEmpty {
      for (k, v) in headers.dictionary {
        localHeaders.add(name: k, value: v)
      }
    }
    
    AF.request(url,
               method: method ?? .get,
               parameters: parameters,
               encoding: encoding ?? URLEncoding.default,
               headers: localHeaders)
      .responseString(queue: DispatchQueue.main,
                      encoding: String.Encoding.utf8,
                      completionHandler: { (response) in
        
        //Log
        NLog("url", String(describing: response.request))
        NLog("header", String(describing: localHeaders))
        NLog("params", String(describing: parameters))
        NLog("statusCode", String(describing: response.response?.statusCode))
        
        let jsonStr = String(data: response.data ?? Data(), encoding: .utf8)!
        let pretty = jsonStr.replacingOccurrences(of: "\\", with: "")
        NLog("response", pretty)
        
        if let error = response.error {
          if error.responseCode == -1009 {
            completion(.failure(ErrorMessage(code: -1009, description: "Connection Problem")))
          }else {
            completion(.failure(ErrorMessage(code: -1, description: "Failure")))
          }
          return
        }
        
        guard let code = response.response?.statusCode else {
          completion(.failure(ErrorMessage(code: -2, description: "Can't Define Error")))
          return
        }
        
        if 200 ... 299 ~= code  {
          //success
          guard let data = response.data else {
            completion(.failure(ErrorMessage(code: -3, description: "Data Not Found")))
            return
          }
          
          //parsing json
          do {
            let json = try JSONDecoder().decode(T.self, from: data)
            completion(.success(json))
            
          } catch {
            completion(.failure(ErrorMessage(code: -4, description: "Parse Error")))
          }
          
          
        } else if code == 401 {
          completion(.failure(ErrorMessage(code: 401, description: "Unauthorized")))
          
        } else if code == 404 {
          completion(.failure(ErrorMessage(code: 404, description: "Source Not Found")))
          
        } else if code == 500 {
          //internal server error
          completion(.failure(ErrorMessage(code: 500, description: "Internal Server Error")))
          
        } else {
          // throw unknown error
          completion(.failure(ErrorMessage(code: -5, description: "Unkonwn Error")))
        }
      })
    
  }
  
  
}
