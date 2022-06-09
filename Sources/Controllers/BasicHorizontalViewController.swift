//
//  BasicHorizontalViewController.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 13/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import Foundation
import UIKit

open class BasicHorizontalViewController: BaseListViewController {
  
  public var items: [ItemViewModel]
  
  public init(items: [ItemViewModel]) {
    self.items = items
    super.init(nibName: nil, bundle: nil)
  }
  
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    scrollDirection = .horizontal
    collectionView.alwaysBounceVertical = false
  }
  
}

open class BasicVerticalViewController: BaseListViewController {
  
  public var items: [ItemViewModel]
  
  public init(items: [ItemViewModel]) {
    self.items = items
    super.init(nibName: nil, bundle: nil)
  }
  
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    scrollDirection = .vertical
  }
  
}
