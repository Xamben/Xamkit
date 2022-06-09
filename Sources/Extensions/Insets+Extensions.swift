//
//  Insets+Extensions.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 14/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import Foundation
import UIKit

extension UIEdgeInsets {
  
  public init(vertical: CGFloat, horizontal: CGFloat) {
    self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
  }
  
}
