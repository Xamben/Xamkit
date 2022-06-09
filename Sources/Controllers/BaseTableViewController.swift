//
//  BaseTableViewController.swift
//  
//
//  Created by Ilham Hadi P. on 12/05/22.
//  Copyright © 2021 Xamben. All rights reserved.
//
//

import UIKit

open class BaseTableViewController: UIViewController {

  public var items: [TableItemViewModel] = [] {
    didSet {
      registerCell()
    }
  }
  
  public lazy var tableView: UITableView = {
    let tv = UITableView()
    tv.delegate = self
    tv.dataSource = self
    tv.backgroundColor = .white
    tv.rowHeight = UITableView.automaticDimension
    tv.estimatedRowHeight = 60
    tv.showsVerticalScrollIndicator = false
    tv.alwaysBounceVertical = true
    
    //Register Cell
    tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return tv
  }()
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
  }
  
  public func registerCell(){
    let filtered = removeDuplicatedIdentifier()
    for item in filtered {
      tableView.register(item.type, forCellReuseIdentifier: item.identifier)
    }
  }
  
  private func removeDuplicatedIdentifier() -> [TableItemViewModel]{
    let shrinkItems = Set(items)
    return Array(shrinkItems)
  }
  
}

extension BaseTableViewController: UITableViewDataSource {
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = items[indexPath.item]
    let cell = dequeue(type: item.type, reuseIdentifier: item.identifier, cellForItemAt: indexPath) as! ParentTableViewCell
    cell.setViewModel(item)
    return cell
  }
  
  func dequeue<T>(type: T.Type,
                  reuseIdentifier: String,
                  cellForItemAt indexPath: IndexPath) -> UITableViewCell where T: UITableViewCell{
    
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! T
    cell.selectionStyle = .none
    return cell
  }
  
}

extension BaseTableViewController: UITableViewDelegate {
  
  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}
