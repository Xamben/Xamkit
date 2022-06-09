//
//  BasePresenter.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 04/01/22.
//  Copyright © 2022 Xamben. All rights reserved.
//


import Foundation

public protocol BasePresenter: AnyObject{
  func presentError(_ errorMessage: String)
  func presentLoading(_ state: Bool)
}

public protocol PresenterLoading {
  func presentLoading(_ state: Bool)
}

public protocol PresentExpiration {
  func presentExpired(_ message: String)
}
