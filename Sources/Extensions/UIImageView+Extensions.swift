//
//  UIImageView+Extensions.swift
//  
//
//  Created by Ilham Hadi Prabawa on 15/04/22.
//  Copyright © 2021 Xamben. All rights reserved.
//
//

import Foundation
import UIKit

extension UIImageView {
  
  public func roundedImage(with layer: CALayer, radius: CGSize, corners: UIRectCorner) {
    let maskLayer = CAShapeLayer()
    layer.frame = self.bounds
    
    let path = UIBezierPath(roundedRect: self.bounds,
                            byRoundingCorners: corners,
                            cornerRadii: radius)
    maskLayer.path = path.cgPath
    layer.mask = maskLayer
    self.layer.addSublayer(layer)
  }
  
}
