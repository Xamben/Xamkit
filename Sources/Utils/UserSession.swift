//
//  UserSession.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 04/01/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import Foundation

struct UserSession{
  
  private let userDefaults = UserDefaults.standard
  
  static var sharedInstance: UserSession = {
    return UserSession()
  }()
  
  var samuelAccessToken: String {
    get{
      return userDefaults.string(forKey: Constant.SAMUEL_ACCESS_TOKEN) ?? ""
    }
    
    set{
      userDefaults.set(newValue, forKey: Constant.SAMUEL_ACCESS_TOKEN)
    }
  }
  
  var samuelClientCode: String {
    get{
      return userDefaults.string(forKey: Constant.SAMUEL_CLIENT_CODE) ?? ""
    }
    
    set{
      userDefaults.set(newValue, forKey: Constant.SAMUEL_CLIENT_CODE)
    }
  }
  
  var samuelToken: String {
    return "09d52fa7f47051fd0b05f676193804513c814da3b21f3d1f758a7bf0f80d9c"
  }
  
  var skipBuyConfirm: Bool {
    get {
      return userDefaults.bool(forKey: Constant.SKIP_BUY_CONFIRMATION)
    }
    set {
      userDefaults.set(newValue, forKey: Constant.SKIP_BUY_CONFIRMATION)
    }
  }
  
  var skipSellConfirm: Bool {
    get {
      return userDefaults.bool(forKey: Constant.SKIP_SELL_CONFIRMATION)
    }
    set {
      userDefaults.set(newValue, forKey: Constant.SKIP_SELL_CONFIRMATION)
    }
  }
  
  
  func endSession(){
    userDefaults.removeObject(forKey: Constant.SAMUEL_CLIENT_CODE)
    userDefaults.removeObject(forKey: Constant.SAMUEL_ACCESS_TOKEN)
  }
}
