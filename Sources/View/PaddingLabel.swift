//
//  PaddingLabel.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 03/02/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import Foundation
import UIKit

public class PaddingLabel: UILabel {
  
  var topInset: CGFloat = 5.0
  var bottomInset: CGFloat = 5.0
  var leftInset: CGFloat = 7.0
  var rightInset: CGFloat = 7.0
  
  override public func drawText(in rect: CGRect) {
    let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    super.drawText(in: rect.inset(by: insets))
  }
  
  override public var intrinsicContentSize: CGSize {
    let size = super.intrinsicContentSize
    return CGSize(width: size.width + leftInset + rightInset,
                  height: size.height + topInset + bottomInset)
  }
  
  override public var bounds: CGRect {
    didSet {
      // ensures this works within stack views if multi-line
      preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
    }
  }
}
