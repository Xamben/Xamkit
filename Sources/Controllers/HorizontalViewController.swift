//
//  HorizontalViewController.swift
//  ListViewApp
//
//  Created by Ilham Hadi Prabawa on 13/04/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import UIKit

class HorizontalViewController: BaseListViewController {
  
  var pageControl: UIPageControl = {
    let pc = UIPageControl()
    pc.currentPage = 0
    pc.pageIndicatorTintColor = .brown
    pc.currentPageIndicatorTintColor = .red
    return pc
  }()
  
  let data: [ItemViewModel]
  
  init(data: [ItemViewModel]) {
    self.data = data
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    scrollDirection = .horizontal
    constructItems()
    registerCell()
    
    self.view.addSubview(pageControl)
    pageControl.snp.makeConstraints { make in
      make.top.equalTo(collectionView.snp.bottom)
      make.bottom.equalTo(collectionView.snp.bottom)
      make.centerX.equalTo(self.view.snp.centerX)
    }
    
  }
  
  fileprivate func setCurrentPage(_ index: Int) {
    pageControl.currentPage = index
  }
  
  fileprivate func numberOfPages(_ pages: Int) {
    pageControl.numberOfPages = pages
  }
  
  fileprivate func constructItems(){
    guard let data = sections.first?.items else { return }
    numberOfPages(data.count/2)
  }
  
}

extension HorizontalViewController {
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                 withVelocity velocity: CGPoint,
                                 targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let x = targetContentOffset.pointee.x
    let current = x / view.frame.width
    setCurrentPage(Int(current))
  }
  
}
