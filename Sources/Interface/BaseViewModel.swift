//
//  BaseViewModel.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 18/12/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation

public protocol BaseViewModel {
  var id: String {get}
  var title: String {get}
  var subTitle: String {get}
}
