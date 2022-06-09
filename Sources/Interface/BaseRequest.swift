//
//  BaseRequest.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 21/12/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation

public enum Order: String {
  case asc = "ASC"
  case desc = "DESC"
}

public protocol BaseRequest {
  var page: Int? { get set }
  var pageSize: Int? { get set }
  var order: Order? { get set }
  var search: String? { get set }
}

public struct GeneralRequest: BaseRequest, Printout {
  
  public var page: Int?
  
  public var pageSize: Int?
  
  public var order: Order?
  
  public var search: String?
  
  public func toDict() -> [String : Any] {
    
    var dict: [String: Any] = [:]
    
    if let page = page {
      dict["page"] = page
    }
    
    if let pageSize = pageSize {
      dict["page_size"] = pageSize
    }
    
    if let order = order {
      dict["order"] = order
    }
    
    if let search = search {
      dict["search"] = search
    }
    
    return dict
  }
}
