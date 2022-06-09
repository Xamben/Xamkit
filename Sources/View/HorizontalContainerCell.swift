//
//  HorizontalContainer.swift
//  ListView
//
//  Created by Ilham Hadi Prabawa on 12/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//

import Foundation
import UIKit

open class BaseHorizontalContainerCell: ParentCollectionCell {
  
  public weak var parentClass: BaseListViewController?
  
  public var childController: BasicHorizontalViewController?
  
  open override func setupView() {
    super.setupView()
  }
  
  open override func setupViewWithData() {
    super.setupViewWithData()
    
  }
  
  open func addToChild(_ controller: BasicHorizontalViewController){
    if childController == nil {
      childController = controller
      guard let childController = childController else {
        return
      }
      
      parentClass?.addChild(childController)
      self.addSubview(childController.view)
      
      childController.view.snp.makeConstraints { make in
        make.width.equalTo(self.snp.width)
        make.height.equalTo(self.snp.height)
      }
      childController.didMove(toParent: parentClass)
    }
  }
  
}
