//
//  Constant.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 04/01/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import Foundation
import UIKit

public enum Constant {
  static let SAMUEL_ACCESS_TOKEN = "samuel_token"
  static let SAMUEL_CLIENT_CODE = "samuel_client_code"
  static let SKIP_BUY_CONFIRMATION = "skip_buy_confirmation"
  static let SKIP_SELL_CONFIRMATION = "skip_sell_confirmation"
  
  enum Message {
    static let LOT_WARNING = "Nominal yang Anda masukkan kurang dari 1 lot"
    static let ORDER_SUCCESS = "Klik OK untuk melihat detail transaksi"
    static let ORDER_BUY = "Masuk antrian beli"
    static let ORDER_SELL = "Masuk antrian jual"
    static let SHOW_MAIN_MENU = "Lihat Menu Utama"
  }
  
  enum TextSize {
    static let BUTTON: CGFloat = 18
    static let MEDIUM: CGFloat = 16
    static let SMALL: CGFloat = 14
  }
  
  enum RegistrationState {
    static let VERIFIED: String = "Verified"
    static let UNVERIFIED: String = "Unverified"
  }
  
}
