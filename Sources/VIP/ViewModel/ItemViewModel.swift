//
//  ItemViewModel.swift
//  ListView
//
//  Created by Ilham Hadi Prabawa on 09/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//

import Foundation
import UIKit

public protocol ItemViewModel {
  var id: Int { get set }
}

public protocol FormItemViewModel: ItemViewModel {
  var type: UICollectionViewCell.Type  { get set }
  var identifier: String  { get set }
  var text: String { get set }
  var onTap: () -> Void { get set }
  var size: CGSize { get set }
}
