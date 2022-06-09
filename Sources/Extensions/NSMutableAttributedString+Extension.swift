//
//  NSMutableString.swift
//
//  Created by Aji Nugrahaning Widhi on 29/12/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation
import UIKit

public extension NSMutableAttributedString {
    
    func setColor(color: UIColor, forText stringValue: String) {
        let range: NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}
