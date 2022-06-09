//  ItemCollectionCellViewModel.swift
//
//  Created by Daniel Prastiwa on 18/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import UIKit


public protocol ItemCollectionCellViewModel: ItemCellViewModel, ItemCellViewSpec {
  var type: UICollectionViewCell.Type { get set }
}
