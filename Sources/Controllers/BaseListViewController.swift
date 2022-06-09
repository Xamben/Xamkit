//
//  BaseListViewController.swift
//  ListViewApp
//
//  Created by Ilham Hadi Prabawa on 13/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//


import Foundation
import UIKit
import SnapKit

open class BaseListViewController: UIViewController {
  
  public var sections: [SectionViewModel] = []
  
  private let flowLayout = UICollectionViewFlowLayout()
  
  public var scrollDirection: UICollectionView.ScrollDirection = .vertical {
    didSet {
      flowLayout.scrollDirection = scrollDirection
    }
  }
  
  public var isPaging: Bool = false{
    didSet{
      collectionView.isPagingEnabled = true
    }
  }
  
  public lazy var collectionView: UICollectionView = {
    let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    cv.alwaysBounceVertical = true
    cv.showsVerticalScrollIndicator = false
    cv.showsHorizontalScrollIndicator = false
    cv.dataSource = self
    cv.delegate = self
    return cv
  }()
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .clear
    collectionView.backgroundColor = .clear
    
    self.view.addSubview(collectionView)
    collectionView.snp.makeConstraints { make in
      make.leading.equalTo(self.view.snp.leading)
      make.top.equalTo(self.view.snp.top)
      make.trailing.equalTo(self.view.snp.trailing)
      make.bottom.equalTo(self.view.snp.bottom)
    }
    
  }
  
  open func registerCell(){
    let registerSections = removeDuplicatedIdentifier()
    for section in registerSections {
      collectionView.register(section.type, forCellWithReuseIdentifier: section.identifier)
    }
  }
  
  private func removeDuplicatedIdentifier() -> [SectionViewModel]{
    let filtered = Set(sections)
    return Array(filtered)
  }
  
}

extension BaseListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  open func numberOfSections(in collectionView: UICollectionView) -> Int {
    return sections.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return sections[section].items.count
  }
  
  open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let section = sections[indexPath.section]
    let data = section.items[indexPath.row]
    
    let cell = dequeue(type: section.type, reuseIdentifier: section.identifier, cellForItemAt: indexPath) as! ParentCollectionCell
    cell.setData(data)
    return cell
  }
  
  open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
  
  open func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
  }
  
  open func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           sizeForItemAt indexPath: IndexPath) -> CGSize {
    let item = sections[indexPath.section]
    return .init(width: item.width, height: item.height)
  }
  
  open func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
  open func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
  open func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: 0, left: 0, bottom: 10, right: 0)
  }
  
}

public extension BaseListViewController {
  
  func dequeue<T>(type: T.Type,
                  reuseIdentifier: String,
                  cellForItemAt indexPath: IndexPath) -> UICollectionViewCell where T: UICollectionViewCell{
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! T
    return cell
  }
  
}
