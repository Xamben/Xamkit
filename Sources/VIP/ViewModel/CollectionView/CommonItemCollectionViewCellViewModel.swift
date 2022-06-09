//
//  CommonItemViewModel.swift
//  
//
//  Created by Daniel Prastiwa on 27/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//


import Foundation


public struct CommonItemCollectionViewCellViewModel: ItemViewModel {
  
  public init(
    id: Int = -1,
    contentView: ParentView? = nil
    //contentViewModel: ItemViewModel
  ) {
    self.id = id
    self.contentView = contentView
    //self.contentViewModel = contentViewModel
  }
  
  public var id: Int = -1
  public var contentView: ParentView?
  //public var contentViewModel: ItemViewModel
  
}
