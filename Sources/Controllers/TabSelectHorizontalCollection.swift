//
//  TabSelectHorizontalCollection.swift
//  Created by Daniel Prastiwa on 18/04/22.
//  Copyright © 2021 Xamben. All rights reserved.
//
//

import UIKit


open class TabSelectHorizontalCollection: HorizontalCollectionViewController {
  
  public let dataModel = SingleSelectTitles()
  
  public var isMoveFromMain = false
  
  // MARK: - State Mutator
  
  public func store(sources: [ItemTitle]) {
    dataModel.update(sources: sources)
    dataModel.select(for: dataModel.getItem(at: 0))
  }
  
  public func setTabSelection(to indexPath: IndexPath) {
    guard let item = dataModel.getSelectedItem() else { return }
    let currentSelectedItemIndex = dataModel.getIndex(fromItem: item)
    let lastSelectedIndexpath = IndexPath(
      item: currentSelectedItemIndex,
      section: indexPath.section
    )
    
    isMoveFromMain = true
    
    collectionView!.performBatchUpdates(nil) { [self] _ in
      self.collectionView!.selectItem(
        at: indexPath,
        animated: true,
        scrollPosition: .left
      )
      
      self.collectionView(self.collectionView!, didSelectItemAt: indexPath)
      self.collectionView(self.collectionView!, didDeselectItemAt: lastSelectedIndexpath)
    }
  }
  
  // MARK: - Lifecycle
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    collectionView!.backgroundColor = .clear
    
    collectionView!.performBatchUpdates(nil) { _ in
      let firstIndexPath = IndexPath(item: 0, section: 0)
      
      self.collectionView!.selectItem(
        at: firstIndexPath,
        animated: true,
        scrollPosition: .left
      )
      
      self.collectionView(self.collectionView!, didSelectItemAt: firstIndexPath)
    }
  }
  
  open override func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    var item = displayItems[indexPath.item] as! SelectableItemCollectionCellViewModel
    item.checked = dataModel.getSelected(for: item.item as! ItemTitle)
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: item.identifier,
      for: indexPath
    ) as! ItemCollectionViewCell
    cell.configure(viewModel: item)
    return cell
  }
  
  open override func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath
  ) {
    let theCell = collectionView.cellForItem(at: indexPath)
    if let cell = theCell as? ItemCollectionViewCell {
      var itemViewModel = displayItems[indexPath.item] as! SelectableItemCollectionCellViewModel
      itemViewModel.checked = true
      
      dataModel.select(for: itemViewModel.item as! ItemTitle)
      
      cell.configure(viewModel: itemViewModel)
      
      self.collectionView!.scrollToItem(
        at: indexPath,
        at: .centeredHorizontally,
        animated: true
      )
      
      if isMoveFromMain {
        isMoveFromMain = false
        return
      }
      
      delegate?.didTap(item: itemViewModel, at: indexPath)
    }
  }
  
  open override func collectionView(
    _ collectionView: UICollectionView,
    didDeselectItemAt indexPath: IndexPath
  ) {
    if let cell = collectionView.cellForItem(at: indexPath) as? ItemCollectionViewCell {
      var itemViewModel = displayItems[indexPath.item] as! SelectableItemCollectionCellViewModel
      itemViewModel.checked = false
      cell.configure(viewModel: itemViewModel)
    }
  }
  
  open override func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    return 4
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    return .init(
      top: 0,
      left: 33,
      bottom: 0,
      right: 33
    )
  }
  
}
