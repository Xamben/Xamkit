//
//  WeakRefCapture.swift
//  
//
//  Created by Daniel Prastiwa on 23/03/22.
//  Copyright © 2022 Xamben. All rights reserved.
//
//

import Foundation

struct Ref<T: AnyObject> {
  weak var ref: T?
  
  init(_ ref: T?) {
    self.ref = ref
  }
  
  func captureWeakly(
    didEstablishStrongRef: @escaping (T)->(),
    ifNil: (()->())? = nil
  ) -> ()->() {
    return { [weak ref] in
      guard let ref = ref else {
        ifNil?()
        return
      }
      didEstablishStrongRef(ref)
    }
  }
  
}
