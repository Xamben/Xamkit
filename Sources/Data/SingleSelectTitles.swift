//
//  SingleSelectTitles.swift
//  Created by Daniel Prastiwa on 18/04/22.
//

import Foundation


open class SingleSelectTitles {
  
  public var sources: [ItemTitle] { _sources }
  public var selectedItems: [Int : Bool] { _selectedItems }
  
  private var _sources: [ItemTitle] = []
  private var _selectedItems: [Int : Bool] = [:]
  
  public var count: Int { sources.count }
  
  func update(sources: [ItemTitle]) {
    self._sources = sources
  }
  
  func update(selectedItems: [Int : Bool]) {
    self._selectedItems = selectedItems
  }
  
  func select(for item: ItemTitle) {
    if selectedItems[item.id] == nil {
      _selectedItems[item.id] = true
    }
    
    if selectedItems.count == 1 {
      return
    }
    
    for key in selectedItems.keys {
      _selectedItems[key] = key == item.id
    }
  }
  
  func getItem(at index: Int) -> ItemTitle {
    return sources[index]
  }
  
  func getSelected(for item: ItemTitle) -> Bool {
    return selectedItems[item.id] ?? false
  }
  
  func getSelectedItem() -> ItemTitle? {
    for item in sources {
      for (id, selected) in selectedItems {
        if selected && id == item.id {
          return item
        }
      }
    }
    return nil
  }
  
  func getIndex(fromItem item: ItemTitle) -> Int {
    for (idx, itm) in sources.enumerated() {
      if itm.id == item.id {
        return idx
      }
    }
    return -1
  }
}
