//
//  UILabel+Extension.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 17/11/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation
import UIKit

public extension UILabel {
  func setHTMLFromString(htmlText: String) {
    let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', 'Rubik-Reguler'; font-size: \(self.font!.pointSize)\">%@</span>", htmlText)
    
    let attrStr = try! NSAttributedString(
      data: modifiedFont.data(using: .unicode, allowLossyConversion: true)!,
      options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue],
      documentAttributes: nil)
    
    self.attributedText = attrStr
  }
  
  func setLeftIcon(with imageName: String, text: String, offsetY: CGFloat = -4.0) {
    // Create Attachment
    let imageAttachment = NSTextAttachment()
    imageAttachment.image = UIImage(named: imageName)
    
    // Set bound to reposition
    let imageOffsetY: CGFloat = offsetY
    imageAttachment.bounds = CGRect(x: 0,
                                    y: imageOffsetY,
                                    width: imageAttachment.image!.size.width,
                                    height: imageAttachment.image!.size.height)
    
    // Create string with attachment
    let attachmentString = NSAttributedString(attachment: imageAttachment)
    
    // Initialize mutable string
    let completeText = NSMutableAttributedString(string: "")
    
    // Add image to mutable string
    completeText.append(attachmentString)
    
    // Add your text to mutable string
    let textAfterIcon = NSAttributedString(string: " \(text)")
    completeText.append(textAfterIcon)
    
    self.attributedText = completeText
  }
  
  func setRightIcon(with imageName: String,
                    text: String,
                    offsetY: CGFloat = 4.0){
    
    //Create Attachment
    let imageAttachment = NSTextAttachment()
    imageAttachment.image = UIImage(named: imageName)
    
    // Set bound to reposition
    imageAttachment.bounds = CGRect(x: 0,
                                    y: offsetY,
                                    width: imageAttachment.image!.size.width,
                                    height: imageAttachment.image!.size.height)
    
    // Create string with attachment
    let attachmentString = NSAttributedString(attachment: imageAttachment)
    
    // Initialize mutable string
    let completeText = NSMutableAttributedString(string: "\(text) ")
    
    // Add image to mutable string
    completeText.append(attachmentString)
    
    //        // Add your text to mutable string
    //        let textAfterIcon = NSAttributedString(string: " \(text)")
    //        completeText.append(textAfterIcon)
    
    self.attributedText = completeText
  }
}
