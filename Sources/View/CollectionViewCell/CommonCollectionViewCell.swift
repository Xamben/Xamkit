//
//  CommonCollectionViewCell.swift
//  
//
//  Created by Daniel Prastiwa on 27/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//


import UIKit
import SnapKit


public class CommonCollectionViewCell: ParentCollectionCell {
  
  public var customContentView: ParentView? {
    didSet {
      guard let view = customContentView else { return }
      addSubview(view)
      view.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
    }
  }
  
  override public func setupViewWithData() {
    super.setupViewWithData()
    
    guard
      let viewModel = data as? CommonItemCollectionViewCellViewModel
    else { return }
    
    customContentView = viewModel.contentView
    //customContentView!.configure(viewModel: viewModel.contentViewModel)
    
  }
  
}
