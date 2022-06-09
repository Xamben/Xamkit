//  HorizontalCollectionViewController.swift
//  Created by Daniel Prastiwa on 18/04/22.
//  Copyright © 2021 Xamben. All rights reserved.
//
//

import UIKit


public protocol HorizontalCollectionViewControllerDelegate: AnyObject {
  func didTap(item: ItemCollectionCellViewModel)
  func didTap(
    item: ItemCollectionCellViewModel,
    at indexPath: IndexPath
  )
}


extension HorizontalCollectionViewControllerDelegate {
  func didTap(
    item: ItemCollectionCellViewModel,
    at indexPath: IndexPath
  ) {}
}

open class HorizontalCollectionViewController: UICollectionViewController,
                                               UICollectionViewDelegateFlowLayout {
  
  public var displayItems: [ItemCollectionCellViewModel] = [] {
    didSet {
      collectionView?.reloadData()
    }
  }
  
  public weak var delegate: HorizontalCollectionViewControllerDelegate?
  
  convenience init() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    self.init(collectionViewLayout: layout)
  }
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView!.alwaysBounceHorizontal = true
    collectionView!.showsHorizontalScrollIndicator = false
    
    setupItems()
    registerCell()
    
    collectionView?.reloadData()
  }
  
  open func registerCell() {
    var dict: [String: UICollectionViewCell.Type] = [:]
    
    displayItems.forEach {
      dict[$0.identifier] = $0.type
    }
    
    for (identifier, cell) in dict {
      self.collectionView!.register(
        cell.self,
        forCellWithReuseIdentifier: identifier
      )
    }
    
  }
  
  open func setupItems() {}
  
  // MARK: UICollectionViewDataSource
  
  open override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  open override func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return displayItems.count
  }
  
  open override func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let item = displayItems[indexPath.item]
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: item.identifier,
      for: indexPath
    ) as! ItemCollectionViewCell
    cell.configure(viewModel: item)
    return cell
  }
  
  open func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let item = displayItems[indexPath.item]
    return CGSize(
      width: item.width,
      height: item.height
    )
  }
  
  open func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    return 14
  }
  
}
