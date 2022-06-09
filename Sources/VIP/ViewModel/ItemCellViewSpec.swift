//
//  ItemCellViewSpec.swift
//  Created by Daniel Prastiwa on 18/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//

import UIKit


public protocol ItemCellViewSpec {
  var id: Int { get set }
  var identifier: String { get set }
  var width: CGFloat { get set }
  var height: CGFloat { get set }
}
