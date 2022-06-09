//
//  UIimageExt.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 26/12/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
  func downsample(imageAt imageURL: URL,
                  to pointSize: CGSize,
                  scale: CGFloat) -> UIImage? {
    
    //create an cgimagesource that represent an image
    let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
    guard let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions) else {
      return nil
    }
    
    let maxDimensionInPixels = max(pointSize.width, pointSize.height) * scale
    
    let downsampleOptions = [
      kCGImageSourceCreateThumbnailFromImageAlways: true,
      kCGImageSourceShouldCacheImmediately: true,
      kCGImageSourceCreateThumbnailWithTransform: true,
      kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels
    ] as CFDictionary
    
    guard let downsampleImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampleOptions)
    else {
      return nil
    }
    
    return UIImage(cgImage: downsampleImage)
  }
}
