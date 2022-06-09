//
//  ParentView.swift
//  
//
//  Created by Daniel Prastiwa on 27/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//


import UIKit


open class ParentView: UIView {
  
  public let viewModel: ItemViewModel
  
  public init(viewModel: ItemViewModel) {
    self.viewModel = viewModel
    super.init(frame: .zero)
    setupView()
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open func setupView() {}
  
}
