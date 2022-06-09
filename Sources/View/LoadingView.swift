//
//  LoadingView.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 22/11/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import UIKit

public class LoadingView: UIView {
  
  let width: CGFloat = 120
  let height: CGFloat = 120
  
  var isShow: Bool = false {
    didSet {
      isShow == true ? startAnimation() : stopAnimation()
    }
  }
  
  var containerLayer: CAShapeLayer!
  var backgroundLayer: CAShapeLayer!
  
  lazy var imageView: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "logo_small")
    return iv
  }()
  
  lazy var loadingIndicator: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView()
    indicator.translatesAutoresizingMaskIntoConstraints = true
    indicator.style = .gray
    return indicator
  }()
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func startAnimation(){
    let animation = CABasicAnimation(keyPath: "opacity")
    animation.fromValue = 0
    animation.toValue = 1
    animation.duration = 0.5
    backgroundLayer.add(animation, forKey: "mask")
    
    loadingIndicator.startAnimating()
  }
  
  private func stopAnimation(){
    let animation = CABasicAnimation(keyPath: "opacity")
    animation.fromValue = 1
    animation.toValue = 0
    animation.duration = 0.5
    backgroundLayer.add(animation, forKey: "mask")
    
    loadingIndicator.stopAnimating()
  }
  
  private func setupView(){
    addSubview(imageView)
    addSubview(loadingIndicator)
    
    imageView.frame = CGRect(x: screen.midX - 100/2, y: screen.midY - 13, width: 100, height: 15)
    loadingIndicator.frame = CGRect(x: screen.midX - 30/2, y: screen.midY + 10, width: 30, height: 30)
    
    containerLayer = CAShapeLayer()
    let path = UIBezierPath(roundedRect: CGRect(x: screen.midX - width/2, y: screen.midY - height/2, width: 120, height: 120), cornerRadius: 16)
    containerLayer.path = path.cgPath
    containerLayer.fillColor = UIColor.white.cgColor
    self.layer.addSublayer(containerLayer)
    
    backgroundLayer = CAShapeLayer()
    backgroundLayer.path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: screen.width, height: screen.height)).cgPath
    backgroundLayer.fillColor = UIColor(white: 0, alpha: 0.25).cgColor
    self.layer.addSublayer(backgroundLayer)
    
    backgroundLayer.zPosition = 0
    containerLayer.zPosition = 1
    imageView.layer.zPosition = 2
    loadingIndicator.layer.zPosition = 2
  }
  
}
