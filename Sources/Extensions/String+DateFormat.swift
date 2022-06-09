//
//  String+DateFormat.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 15/11/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation
import UIKit

public extension String{
  func toDate() -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(identifier: "Asia/Jakarta")
    dateFormatter.locale = Locale(identifier: "id_ID")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    return dateFormatter.date(from: self)
  }
  
  func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
    let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
    let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin,
                                        attributes: [NSAttributedString.Key.font: font], context: nil)
    
    return ceil(boundingBox.height)
  }
  
  func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
    let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
    let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin,
                                        attributes: [NSAttributedString.Key.font: font], context: nil)
    
    return ceil(boundingBox.width)
  }
}
