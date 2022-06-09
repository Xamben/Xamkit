//
//  DependencyInjection.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 18/11/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation

public struct DependencyInjection {
  
  public static func provideRemoteService() -> Service{
    return DIC.shared.resolve(type: Service.self)!
  }
  
  public static func provideLocalService() -> LocalService {
    return DIC.shared.resolve(type: LocalService.self)!
  }
  
}

