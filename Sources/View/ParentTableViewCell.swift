//
//  ParentTableViewCell.swift
//  
//
//  Created by Ilham Hadi P. on 12/05/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//

import UIKit

open class ParentTableViewCell: UITableViewCell {

  public var viewModel: TableItemViewModel?
  
  public init(){
    self.viewModel = nil
    super.init(style: .default, reuseIdentifier: nil)
    setupView()
  }
  
  public init(_ viewModel: TableItemViewModel){
    self.viewModel = viewModel
    super.init(style: .default, reuseIdentifier: nil)
    setupView()
  }
  
  public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    self.viewModel = nil
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func setViewModel(_ viewModel: TableItemViewModel){
    self.viewModel = viewModel
    setupViewWithData()
  }
  
  open func setupViewWithData(){
    guard let _ = viewModel else {
      return
    }
  }
  
  open func setupView(){ }

}
