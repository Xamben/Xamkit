//  ItemSectionTableViewModel.swift
//  Created by Daniel Prastiwa on 18/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import UIKit


protocol ItemSectionTableViewModel: ItemCellViewSpec {
  var contents: [ItemTableCellViewModel] { get set }
}
