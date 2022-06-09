//
//  CGFloat.swift
//  
//
//  Created by Ilham Hadi P. on 21/04/22.
//  Copyright © 2021 Xamben. All rights reserved.
//
//

import Foundation
import UIKit

extension CGFloat {
  public func toRadians() -> CGFloat {
    return self * CGFloat(Double.pi) / 180.0
  }
}
