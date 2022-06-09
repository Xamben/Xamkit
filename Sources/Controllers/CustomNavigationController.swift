//
//  CustomNavigationController.swift
//
//  Created by Ilham Hadi Prabawa on 10/19/21.
//  Copyright © 2022 Xamben. All rights reserved.
//

import Foundation
import UIKit

public class CustomNavigationController: UINavigationController {
 
  private var gradientBar: UIImage?
  
  public var backImage = UIImage(named: "ic_back") {
    didSet{
      setupNavBarAppearance()
    }
  }
  
  public var tintColor: UIColor = .white {
    didSet{
      setupNavBarAppearance()
    }
  }
  
  public var barStyle: UIBarStyle = .black {
    didSet{
      setupNavBarAppearance()
    }
  }
  
  public var barColor: UIColor = .clear {
    didSet{
      setupNavBarAppearance()
      setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  lazy public var titleAttribute: [NSAttributedString.Key: Any] = [.foregroundColor: tintColor] {
    didSet{
      setupNavBarAppearance()
    }
  }
  
  override public var preferredStatusBarStyle: UIStatusBarStyle {
    return (barColor == .black) ? .lightContent : .default
  }
  
  public override var prefersStatusBarHidden: Bool{
    return false
  }
  
  public init() {
    super.init(nibName: nil, bundle: nil)
    setupNavBarAppearance()
  }
  
  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
    setupNavBarAppearance()
  }
  
  override public init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
    
    setupNavBarAppearance()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupNavBarAppearance(){
    if #available(iOS 13.0, *) {
      let navBarAppearance = UINavigationBarAppearance()
      navBarAppearance.configureWithDefaultBackground()
      navBarAppearance.titleTextAttributes = titleAttribute
      navBarAppearance.largeTitleTextAttributes = titleAttribute
      navBarAppearance.backgroundColor = barColor
      navigationItem.standardAppearance = navBarAppearance
      navBarAppearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
      navBarAppearance.backgroundImage = getGradientBar()
      
      navigationBar.barStyle = barStyle
      navigationBar.tintColor = tintColor
      navigationBar.standardAppearance = navBarAppearance
      navigationBar.scrollEdgeAppearance = navBarAppearance
      navigationBar.isTranslucent = true
      
      return
    }
    
    //MARK: iOS 12 navigation setup
    print("tintcolor", tintColor)
    let navControl = UINavigationBar.appearance()
    navControl.tintColor = .white
    navControl.barTintColor = barColor
    
    navigationBar.barStyle = barStyle
    navigationBar.titleTextAttributes = [.foregroundColor: tintColor]
    navigationBar.tintColor = tintColor
    navigationBar.backIndicatorImage = backImage
    navigationBar.backIndicatorTransitionMaskImage = backImage
    navigationBar.isTranslucent = true
    
  }
  
  func toggleTabBar(shouldShow: Bool){
    self.tabBarController?.tabBar.isHidden = !shouldShow
  }
  
  public func setGradientBar(colors: [CGColor]){
    let gradientLayer = CAGradientLayer()
    var updatedFrame = self.navigationBar.bounds
    updatedFrame.size.height += UIApplication.shared.statusBarFrame.size.height
    gradientLayer.frame = updatedFrame
    gradientLayer.colors = colors // start color and end color
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0) // Horizontal gradient start
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0) // Horizontal gradient end
    UIGraphicsBeginImageContext(gradientLayer.bounds.size)
    gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
    gradientBar = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    setupNavBarAppearance()
  }
  
  public func getGradientBar() -> UIImage? {
    return gradientBar
  }
  
}
