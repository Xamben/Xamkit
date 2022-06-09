//
//  UIButton+Extension.swift
//  
//
//  Created by Daniel Prastiwa on 22/03/22.
//  Copyright © 2021 Xamben. All rights reserved.
//
//

import UIKit

public class UIButtonClosure {
  
  private let closure: () -> ()
  
  public init(setFor object: AnyObject, closure: @escaping () -> ()) {
    self.closure = closure
    objc_setAssociatedObject(object, "[\(arc4random())]", self, .OBJC_ASSOCIATION_RETAIN)
  }
  
  @objc public func invoke() {
    closure()
  }
  
}

extension UIButton {
  
  func addTapAction(for controlEvent: UIControl.Event = .touchUpInside,
                    action: @escaping () -> ()) {
    let buttonClosure = UIButtonClosure(setFor: self, closure: action)
    addTarget(buttonClosure,
              action: #selector(buttonClosure.invoke),
              for: controlEvent)
  }
}
