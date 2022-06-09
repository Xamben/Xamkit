//
//  RoundedIconView.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 31/12/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation
import UIKit

public class RoundedIconView: UIView{
  
  var imageLayer: CALayer!
  
  var rounded: CGFloat = 10 {
    didSet{
      self.layer.cornerRadius = rounded
    }
  }
  
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
  
  var imageSize: CGSize = .init(width: 15, height: 15){
    didSet{
      setNeedsLayout()
    }
  }
  
  var didTap: (() -> Void)?
  
  override public init(frame: CGRect) {
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
    self.layer.cornerRadius = rounded
    self.layer.borderColor = UIColor.shopEventBorderColor.cgColor
    self.layer.borderWidth = 1
    self.layer.masksToBounds = true
    
    self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
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
  
  @objc func tapAction() {
    didTap?()
  }
}
