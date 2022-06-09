//
//  BaseDisplayLogic.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 04/01/22.
//  Copyright © 2022 Xamben. All rights reserved.
//



import Foundation

public protocol BaseDisplayLogic: AnyObject{
  func displayError(_ errorMessage: String)
}

public protocol DisplayLoadingLogic: AnyObject {
  func displayLoading(_ state: Bool)
}

public protocol DisplayExpiration: AnyObject {
  func displayExpiredAlert(_ message: String)
}
