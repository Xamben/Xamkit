//
//  Entity.swift
//  Created by Daniel Prastiwa on 18/04/22.
//

import Foundation


public protocol Entity {}


public protocol ItemTitle: Entity {
  var id: Int { set get }
  var title: String { set get }
}
