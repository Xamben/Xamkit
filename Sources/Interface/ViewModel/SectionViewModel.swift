//
//  SectionViewModel.swift
//  ListView
//
//  Created by Ilham Hadi Prabawa on 06/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//

import Foundation
import UIKit

open class SectionViewModel: Hashable {
  
  public let id: Int
  public let type: UICollectionViewCell.Type
  public let identifier: String
  public let items: [ItemViewModel]
  public let width: Int
  public let height: Int
  
  public init(id: Int,
       type: UICollectionViewCell.Type,
       identifier: String,
       items: [ItemViewModel],
       width: Int,
       height: Int) {
    
    self.id = id
    self.type = type
    self.identifier = identifier
    self.items = items
    self.width = width
    self.height = height
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(identifier)
  }
  
  public static func == (lhs: SectionViewModel, rhs: SectionViewModel) -> Bool {
    return lhs.identifier == rhs.identifier
  }
  
}

public protocol FormSectionViewModel {
  var id: Int { get set }
  var items: [FormItemViewModel]  { get set }
}
