//
//  HorizontalCell.swift
//  ListView
//
//  Created by Ilham Hadi Prabawa on 12/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//

import UIKit

public class HorizontalCell: ParentCollectionCell, CellIdentifier {
  
  public static var reuseIdentifier: String = String(describing: HorizontalCell.self)
  
  var symbolLabel: UILabel = {
    let label = UILabel()
    label.text = "BBCA"
    label.font = .systemFont(ofSize: 18, weight: .bold)
    label.textColor = UIColor.white
    label.isUserInteractionEnabled = true
    return label
  }()
  
  public override func setupView() {
    super.setupView()
    
    symbolLabel.snp.makeConstraints { make in
      make.center.equalTo(self.snp.center)
    }
  }
  
  public override func setupViewWithData() {
    super.setupViewWithData()
  }
  
}
