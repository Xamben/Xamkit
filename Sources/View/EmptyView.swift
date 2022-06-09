//
//  EmptyView.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 24/11/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public class EmptyView: UIView{
  
  var didSetupConstraints = false
  
  var tapAction: (() -> Void)?
  
  var imageName: String? = ""{
    didSet {
      imageView.image = UIImage(named: imageName ?? "ic_banner_b")
    }
  }
  
  var title: String = "" {
    didSet{
      titleLabel.text = title
    }
  }
  
  var message: String = "" {
    didSet {
      descriptionLabel.text = message
    }
  }
  
  var buttonTitle: String? {
    didSet {
      guard let buttonTitle = buttonTitle else {
        return
      }
      
      button.setTitle(buttonTitle, for: .normal)
    }
  }
  
  let imageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    return iv
  }()
  
  var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.numberOfLines = 0
    return label
  }()
  
  var descriptionLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 16)
    return label
  }()
  
  private lazy var button: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTap(_:)), for: .touchUpInside)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    layer.cornerRadius = 3
    layer.masksToBounds = true
    
    addSubview(imageView)
    addSubview(titleLabel)
    addSubview(descriptionLabel)
    addSubview(button)
    
    setNeedsUpdateConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func updateConstraints() {
    if !didSetupConstraints {
      
      imageView.snp.makeConstraints { make in
        make.height.equalTo(150)
        make.width.equalTo(150)
        make.top.equalTo(self).inset(screen.height/2 - 200)
        make.centerX.equalTo(self)
      }
      
      titleLabel.snp.makeConstraints { make in
        make.top.equalTo(imageView.snp.bottom).inset(-8)
        make.leading.equalTo(self).inset(16)
        make.trailing.equalTo(self).inset(16)
      }
      
      descriptionLabel.snp.makeConstraints { make in
        make.top.equalTo(titleLabel.snp.bottom).inset(-8)
        make.leading.equalTo(self).inset(16)
        make.trailing.equalTo(self).inset(16)
      }
      
      button.snp.makeConstraints { make in
        make.top.equalTo(descriptionLabel.snp.bottom).inset(-8)
        make.size.equalTo(CGSize(width: 100, height: 30))
        make.centerX.equalTo(self)
      }
      
      didSetupConstraints = true
    }
    
    super.updateConstraints()
  }
  
  @objc
  func didTap(_ : UIButton){
    tapAction?()
  }
  
  deinit {
    imageName = ""
    title = ""
    message = ""
    NLog("deinit", "empty view")
  }
}
