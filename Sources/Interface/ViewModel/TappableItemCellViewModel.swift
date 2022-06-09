//
//  TappableItemCellViewModel.swift
//  Created by Daniel Prastiwa on 18/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//

import Foundation


public protocol TappableItemCellViewModel {
  var onTap: ((ItemCellViewModel) -> Void)? { set get }
}
