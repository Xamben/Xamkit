//
//  BlurLabel.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 20/01/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import Foundation
import UIKit

public class BlurredLabel: UILabel {
  
  func blur(_ blurRadius: Double = 2.5) {
    let blurredImage = getBlurryImage(blurRadius)
    let blurredImageView = UIImageView(image: blurredImage)
    blurredImageView.translatesAutoresizingMaskIntoConstraints = false
    blurredImageView.tag = 100
    blurredImageView.contentMode = .center
    blurredImageView.backgroundColor = .white
    addSubview(blurredImageView)
    NSLayoutConstraint.activate([
      blurredImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      blurredImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
  
  func unblur() {
    subviews.forEach { subview in
      if subview.tag == 100 {
        subview.removeFromSuperview()
      }
    }
  }
  
  private func getBlurryImage(_ blurRadius: Double = 2.5) -> UIImage? {
    UIGraphicsBeginImageContext(bounds.size)
    layer.render(in: UIGraphicsGetCurrentContext()!)
    guard let image = UIGraphicsGetImageFromCurrentImageContext(),
          let blurFilter = CIFilter(name: "CIGaussianBlur") else {
      UIGraphicsEndImageContext()
      return nil
    }
    UIGraphicsEndImageContext()
    
    blurFilter.setDefaults()
    
    blurFilter.setValue(CIImage(image: image), forKey: kCIInputImageKey)
    blurFilter.setValue(blurRadius, forKey: kCIInputRadiusKey)
    
    var convertedImage: UIImage?
    let context = CIContext(options: nil)
    if let blurOutputImage = blurFilter.outputImage,
       let cgImage = context.createCGImage(blurOutputImage, from: blurOutputImage.extent) {
      convertedImage = UIImage(cgImage: cgImage)
    }
    
    return convertedImage
  }
}
