//
//  RoundedFilledImage.swift
//  
//
//  Created by Ilham Hadi P. on 21/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//

import UIKit

open class RoundedFilledImage: UIView {
  
  var containerLayer: CAShapeLayer?
  var imageLayer: CALayer?
  
  let imageName: String
  let imageSize: CGSize
  
  public init(imageName: String, imageSize: CGSize){
    self.imageName = imageName
    self.imageSize = imageSize
    super.init(frame: .zero)
  }
  
  public override init(frame: CGRect) {
    self.imageName = ""
    self.imageSize = .zero
    super.init(frame: frame)
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    
    makeCircleLayer()
  }
  
  private func makeCircleLayer(){
    containerLayer = CAShapeLayer()
    imageLayer = CALayer()
    guard let containerLayer = containerLayer,
          let imageLayer = imageLayer
    else { return }
    
    imageLayer.frame = self.bounds
    imageLayer.contents = UIImage(named: imageName)?.cgImage
    imageLayer.frame = .init(x: center.x, y: center.y, width: imageSize.width, height: imageSize.height)
    imageLayer.position = CGPoint(x: center.x, y: center.y)
    imageLayer.shouldRasterize = true
    
    let circlePath = UIBezierPath(arcCenter: center,
                                  radius: imageSize.width,
                                  startAngle: CGFloat(270).toRadians(),
                                  endAngle: CGFloat(-90).toRadians(),
                                  clockwise: false)
    
    containerLayer.path = circlePath.cgPath
    containerLayer.frame = .init(x: 0,
                                 y: 0,
                                 width: imageSize.width + 10,
                                 height: imageSize.height + 10)
    containerLayer.fillColor = UIColor(white: 1, alpha: 1).cgColor
    containerLayer.shouldRasterize = true
    
    self.layer.addSublayer(containerLayer)
    containerLayer.addSublayer(imageLayer)
  }
}
