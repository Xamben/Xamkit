//
//  TableItemViewModel.swift
//  
//
//  Created by Ilham Hadi P. on 12/05/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//

import Foundation
import UIKit

open class TableItemViewModel: Hashable {
  
  public var id: Int
  public var type: UITableViewCell.Type
  public var identifier: String
  
  public init(id: Int,
              type: UITableViewCell.Type,
              identifier: String) {
    self.id = id
    self.type = type
    self.identifier = identifier
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(identifier)
  }
  
  public static func == (lhs: TableItemViewModel, rhs: TableItemViewModel) -> Bool {
    return lhs.identifier == rhs.identifier
  }
  
}
