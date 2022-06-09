//
//  LocalService.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 22/11/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation

public class LocalServiceImpl: LocalService{
  
  public func parsingJSON<T>(of type: T.Type, from data: Data) -> Result<T, ErrorMessage> where T: Codable{
    do {
      let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
      
      let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
      let model = try JSONDecoder().decode(T.self, from: jsonData)
      return .success(model)
      
    } catch let error {
      print("parse_error", error)
    }
    
    return .failure(ErrorMessage(code: -3, description: "Parse Error"))
  }
  
  public func loadJsonFromFile(with url: String) -> Data {
    guard let pathString = Bundle.main.url(forResource: url, withExtension: "json") else {
      fatalError("File not found")
    }
    
    guard let data = try? Data(contentsOf: pathString) else {
      fatalError("Unable to convert json to String")
    }
    
    return data
  }
  
}

public class ServiceHelper: LocalService{
  
  public func parsingJSON<T>(of type: T.Type, from data: Data) -> Result<T, ErrorMessage> where T : Decodable, T : Encodable {
    do {
      let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
      
      let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
      let model = try JSONDecoder().decode(T.self, from: jsonData)
      return .success(model)
      
    } catch let error {
      print("parse_error", error)
    }
    return .failure(ErrorMessage(code: -5, description: "Unknown Error"))
  }
  
  public func loadJsonFromFile(with url: String) -> Data {
    guard let pathString = Bundle.main.url(forResource: url, withExtension: "json") else {
      fatalError("File not found")
    }
    
    guard let data = try? Data(contentsOf: pathString) else {
      fatalError("Unable to convert json to String")
    }
    
    return data
  }
  
}
