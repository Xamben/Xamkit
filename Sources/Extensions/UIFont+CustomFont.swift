//
//  UIFont+CustomFont.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 14/02/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import Foundation
import UIKit

public enum FontStyle {
  case title(size: CGFloat)
  case body(size: CGFloat)
}

public extension UIFont {
  
  static func customFont(style: FontStyle) -> UIFont {
    switch style {
    case .title(let size):
      guard let customFont = UIFont(name: "Rubik-Medium", size: size)
      else { return .systemFont(ofSize: size, weight: .medium) }
      return customFont
    case .body(let size):
      guard let customFont = UIFont(name: "Rubik-Regular", size: size)
      else { return .systemFont(ofSize: size, weight: .medium) }
      return customFont
    }
  }
  
}
