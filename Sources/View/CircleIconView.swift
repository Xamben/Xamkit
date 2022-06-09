//
//  TradingIconView.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 15/12/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation
import UIKit

public class CircleIconView: UIView {
  
  var imageLayer: CALayer!
  
  var centerImage: UIImage? {
    didSet{
      setNeedsLayout()
    }
  }
  
  var fillColor: UIColor? = .bondiBlue {
    didSet{
      self.backgroundColor = fillColor
    }
  }
  
  var imageSize: CGSize = .init(width: 0, height: 0){
    didSet{
      setNeedsLayout()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    setupView()
  }
  
  override public func prepareForInterfaceBuilder() {
    setupView()
  }
  
  fileprivate func setupView(){
    self.layer.cornerRadius = self.frame.width / 2
    self.layer.masksToBounds = true
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    imageLayer = CALayer()
    imageLayer.frame = CGRect(x: self.bounds.midX - imageSize.width/2,
                              y: self.bounds.midY - imageSize.height/2,
                              width: imageSize.width,
                              height: imageSize.height)
    imageLayer.contents = centerImage?.cgImage
    self.layer.addSublayer(imageLayer)
  }
  
}
