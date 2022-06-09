//
//  UIColor+Extension.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 02/11/21.
//  Copyright © 2021 Xamben. All rights reserved.
//
//

import Foundation
import UIKit

public extension UIColor {
  
  convenience init(hexString: String, alpha: CGFloat = 1.0) {
    let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let scanner = Scanner(string: hexString)
    if (hexString.hasPrefix("#")) {
      scanner.scanLocation = 1
    }
    var color: UInt32 = 0
    scanner.scanHexInt32(&color)
    let mask = 0x000000FF
    let r = Int(color >> 16) & mask
    let g = Int(color >> 8) & mask
    let b = Int(color) & mask
    let red   = CGFloat(r) / 255.0
    let green = CGFloat(g) / 255.0
    let blue  = CGFloat(b) / 255.0
    self.init(red:red, green:green, blue:blue, alpha:alpha)
  }
  
  func toHexString() -> String {
    var r:CGFloat = 0
    var g:CGFloat = 0
    var b:CGFloat = 0
    var a:CGFloat = 0
    getRed(&r, green: &g, blue: &b, alpha: &a)
    let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
    return String(format:"#%06x", rgb)
  }
  
  class var backgroudColor: UIColor {
    return UIColor(red: 26/255, green: 32/255, blue: 44/255, alpha: 1)
  }
  
  class var navigationColor: UIColor {
    return UIColor(red: 22/255, green: 27/255, blue: 34/255, alpha: 1)
  }
  
  class var buttonColor: UIColor {
    return UIColor(red: 0/255, green: 116/255, blue: 201/255, alpha: 1)
  }
  
  class var buttonColorTosca: UIColor {
    return UIColor(hexString: "#04A9AC")
  }
  
  class var descriptionTextColor: UIColor {
    return UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
  }
  
  class var bottomLine: UIColor {
    return UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
  }
  
  class var titleColor: UIColor {
    return UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
  }
  
  class var discountColor: UIColor {
    return UIColor(red: 212/255, green: 59/255, blue: 59/255, alpha: 1)
  }
  
  class var unpaidButtonColor: UIColor {
    return UIColor(red: 255/255, green: 100/255, blue: 85/255, alpha: 1)
  }
  
  class var bondiBlue: UIColor {
    return UIColor(red: 4/255, green: 169/255, blue: 172/255, alpha: 1)
  }
  
  class var shopEventBorderColor: UIColor {
    return UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
  }
  
  class var contentColor: UIColor {
    return UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
  }
  
  class var dateColor: UIColor {
    return UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)
  }
  
  class var onlineClassMateriColor: UIColor {
    return UIColor(hexString: "#04A9AC", alpha: 1)
  }
  
  class var priceColor: UIColor {
    return UIColor(red: 68/255, green: 68/255, blue: 68/255, alpha: 1)
  }
  
  class var redColor: UIColor {
    return UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 1)
  }
  
  class var greenColor: UIColor {
    return UIColor(red: 106/255, green: 209/255, blue: 160/255, alpha: 1)
  }
  
  class var stockGrey: UIColor{
    return UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
  }
  
  class var warningColor: UIColor {
    return UIColor(red: 212/255, green: 59/255, blue: 59/255, alpha: 0.2)
  }
  
  class var lotColor: UIColor {
    return UIColor(red: 121/255, green: 203/255, blue: 205/255, alpha: 1)
  }
  
  class var onBoardingButton: UIColor {
    return UIColor(red: 255/255, green: 148/255, blue: 65/255, alpha: 1)
  }
}
