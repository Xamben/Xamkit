//
//  ParentCollectionCell.swift
//  ListView
//
//  Created by Ilham Hadi Prabawa on 07/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//

import Foundation
import UIKit

open class ParentCollectionCell: UICollectionViewCell {
  
  public var data: ItemViewModel?
  
  public init(){
    self.data = nil
    super.init(frame: .zero)
    setupView()
  }
  
  public init(_ data: ItemViewModel){
    self.data = data
    super.init(frame: .zero)
    setupView()
  }
  
  public override init(frame: CGRect) {
    self.data = nil
    super.init(frame: frame)
    setupView()
  }
  
  public required init?(coder: NSCoder) {
    self.data = nil
    super.init(coder: coder)
    setupView()
  }
  
  public func setData(_ data: ItemViewModel){
    self.data = data
    setupViewWithData()
  }
  
  open func setupViewWithData(){
    guard let _ = data else {
      return
    }
  }
  
  open func setupView(){ }
}
