//
//  ItemSectionCollectionViewModel.swift
//  Created by Daniel Prastiwa on 18/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//

import Foundation


protocol ItemSectionCollectionViewModel: ItemCellViewSpec {
  var contents: [ItemCollectionCellViewModel] { get set }
}
