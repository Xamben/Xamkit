//
//  Double+Extension.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 12/01/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import Foundation

public extension Double {
  
  func toDecimal() -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = NumberFormatter.Style.decimal
    formatter.roundingMode = NumberFormatter.RoundingMode.halfUp
    formatter.maximumFractionDigits = 2
    return formatter.string(from: NSNumber(value: self))
  }
  
  func toDecimal(with digits: Int) -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = NumberFormatter.Style.decimal
    formatter.roundingMode = NumberFormatter.RoundingMode.halfUp
    formatter.maximumFractionDigits = digits
    return formatter.string(from: NSNumber(value: self))
  }
  
}
