//
//  SliderStepper.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 31/12/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation
import UIKit

public class SliderStepper: UISlider{
  
  //snap slider step
  let stepValue = [0, 25, 50, 75, 100]
  
  //step point
  var point2: CGFloat = 0
  var point3: CGFloat = 0
  var point4: CGFloat = 0
  
  lazy var sliderWidth = self.frame.width
  
  var callback: ((Float) -> Void)?
  
  let point1Label: UILabel = {
    let label = UILabel()
    label.text = "0%"
    label.font = UIFont(name: "Rubik-Medium", size: 14)
    label.textColor = .buttonColor
    return label
  }()
  
  let point2Label: UILabel = {
    let label = UILabel()
    label.text = "25%"
    label.font = UIFont(name: "Rubik-Medium", size: 14)
    label.textColor = .buttonColor
    return label
  }()
  
  let point3Label: UILabel = {
    let label = UILabel()
    label.text = "50%"
    label.font = UIFont(name: "Rubik-Medium", size: 14)
    label.textColor = .buttonColor
    return label
  }()
  
  let point4Label: UILabel = {
    let label = UILabel()
    label.text = "75%"
    label.font = UIFont(name: "Rubik-Medium", size: 14)
    label.textColor = .buttonColor
    return label
  }()
  
  let point5Label: UILabel = {
    let label = UILabel()
    label.text = "100%"
    label.font = UIFont(name: "Rubik-Medium", size: 14)
    label.textColor = .buttonColor
    return label
  }()
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    setSliderLabel()
  }
  
  fileprivate func setupView(){
    addSubview(point1Label)
    addSubview(point2Label)
    addSubview(point3Label)
    addSubview(point4Label)
    addSubview(point5Label)
  }
  
  @objc func handleValueChange(_ slider: UISlider){
    
  }
  
  func snapSlider(_ sliderValue: Float) -> Float{
    var decimal: Float = 0
    for i in 0 ..< stepValue.count {
      let sender = Int(sliderValue * 100)
      
      if sender == 0 {
        return 0
      } else if sender < stepValue[i] {
        let current = stepValue[i]
        let previous = stepValue[i-1]
        let upper = current - sender
        let lower = sender - previous
        if upper < lower {
          decimal = Float(current)/100
          return decimal
        }else {
          decimal = Float(previous)/100
          return decimal
        }
      }else if sender == 100 {
        return 1
      }
    }
    
    return 0
  }
  
  fileprivate func setSliderLabel(){
    
    point2 = sliderWidth * 0.25
    point3 = sliderWidth * 0.50
    point4 = sliderWidth * 0.75
    
    let centerPoint2 = Int(point2 - point2Label.frame.width/2)
    let centerPoint3 = Int(point3 - point3Label.frame.width/2)
    let centerPoint4 = Int(point4 - point4Label.frame.width/2)
    
    point1Label.snp.makeConstraints { make in
      make.leading.equalTo(0)
      make.top.equalTo(self.snp.bottom)
    }
    
    point2Label.snp.makeConstraints { make in
      make.leading.equalTo(centerPoint2 + 8)
      make.top.equalTo(self.snp.bottom)
    }
    
    point3Label.snp.makeConstraints { make in
      make.leading.equalTo(centerPoint3 + 2)
      make.top.equalTo(self.snp.bottom)
    }
    
    point4Label.snp.makeConstraints { make in
      make.leading.equalTo(centerPoint4 - 6)
      make.top.equalTo(self.snp.bottom)
    }
    
    point5Label.snp.makeConstraints { make in
      make.leading.equalTo(self.snp.trailing).offset(-32)
      make.top.equalTo(self.snp.bottom)
    }
  }
}
