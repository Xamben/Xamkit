//
//  BaseUsecase.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 18/11/21.
//  Copyright © Xamben. All rights reserved.
//
//  This file was generated by the VIP Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//

import Foundation

public protocol BaseUsecase {
  associatedtype ResultType
  associatedtype Param
  associatedtype ErrorResult: Error
  
  func execute(param: Param,
               completion: @escaping(Result<ResultType, ErrorResult>) -> Void)
  
}

extension BaseUsecase{
  func execute(param: Param,
               completion: @escaping(Result<ResultType, ErrorResult>) -> Void) {}
}