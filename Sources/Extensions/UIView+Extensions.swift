//
//  UIView+Extensions.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 06/01/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import UIKit
import Foundation

public extension UIView {
  
  class func fromNib<T: UIView>() -> T {
    return Bundle(for: T.self).loadNibNamed(String(describing: T.self),
                                            owner: nil,
                                            options: nil)![0] as! T
  }
  
  func addShadow(cornerRadius: CGFloat,
                 shadowRadius: CGFloat,
                 shadowOffset: CGSize,
                 color: UIColor){
    
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    layer.shadowRadius = shadowRadius
    layer.shadowOffset = shadowOffset
    layer.shadowOpacity = 1
    layer.shadowColor = color.cgColor
  }
}
