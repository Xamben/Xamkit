//
//  UIViewController+Extension.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 10/12/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    /*static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        
        return instantiateFromNib()
    }
    
    func emptyLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0), heightDimension: .fractionalHeight(0))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        return NSCollectionLayoutSection(group: group)
    }
    
    func navigationStyle(){
        let backImage = UIImage(named: "ic_arrow_back")?
            .withRenderingMode(.alwaysOriginal)
            .withAlignmentRectInsets(.init(top: 0, left: -10, bottom: 0, right: 0))
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationItem.backButtonTitle = ""
    }*/
  
  // MARK: - Methods
  public func addFullScreen(childViewController child: UIViewController) {
    guard child.parent == nil else {
      return
    }

    addChild(child)
    view.addSubview(child.view)

    child.view.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      view.leadingAnchor.constraint(equalTo: child.view.leadingAnchor),
      view.trailingAnchor.constraint(equalTo: child.view.trailingAnchor),
      view.topAnchor.constraint(equalTo: child.view.topAnchor),
      view.bottomAnchor.constraint(equalTo: child.view.bottomAnchor)
    ]
    constraints.forEach { $0.isActive = true }
    view.addConstraints(constraints)

    child.didMove(toParent: self)
  }

  public func remove(childViewController child: UIViewController?) {
    guard let child = child else {
      return
    }

    guard child.parent != nil else {
      return
    }
    
    child.willMove(toParent: nil)
    child.view.removeFromSuperview()
    child.removeFromParent()
  }
  
  public func openLink(with url: URL?){
    if #available(iOS 10.0, *) {
      UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    } else {
      UIApplication.shared.openURL(url!)
    }
  }
  
  func addChildController(
    _ child: UIViewController,
    to parentView: UIView? = nil
  ) {
    if let parentView = parentView {
      child.view.frame = parentView.bounds
      parentView.addSubview(child.view)
    } else {
      view.addSubview(child.view)
    }
    
    addChild(child)
    child.didMove(toParent: self)
  }
  
  func removeChildController() {
    guard parent != nil else {
      return
    }
    
    willMove(toParent: nil)
    view.removeFromSuperview()
    removeFromParent()
  }
  
  
  
}
