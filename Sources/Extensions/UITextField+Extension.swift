//
//  UITextField+Extension.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 12/01/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import Foundation
import UIKit

public extension UITextField {
  func lotAttributed(with text: String) {
    let attributedText = NSMutableAttributedString(string: text,
                                                   attributes: [NSAttributedString.Key.font: UIFont(name: "Rubik-Regular", size: 50)
                                                                ?? .systemFont(ofSize: 50)])
    
    attributedText.append(NSAttributedString(string: " lot",
                                             attributes: [NSAttributedString.Key.font: UIFont(name: "Rubik-Regular", size: 14)
                                                          ?? .systemFont(ofSize: 14)]))
    
    self.attributedText = attributedText
  }
}
