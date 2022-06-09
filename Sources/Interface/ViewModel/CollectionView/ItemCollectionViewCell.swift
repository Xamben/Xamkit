//
//  ItemCollectionViewCell.swift
//  Created by Daniel Prastiwa on 18/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import UIKit


public protocol ItemCollectionViewCellInput: AnyObject {
  func didTapView(viewModel: ItemCollectionCellViewModel?)
}


open class ItemCollectionViewCell: UICollectionViewCell {
  public static let cellIdentifier = "\(ItemCollectionViewCell.self)"
  
  public weak var input: ItemCollectionViewCellInput?
  
  public var cellViewModel: ItemCollectionCellViewModel?

  public override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open func configure(viewModel: ItemCellViewModel) {}
  
}
