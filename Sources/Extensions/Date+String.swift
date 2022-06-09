//
//  Date+String.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 22/12/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation

public extension Date {
    func stringFormat() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy MM dd, HH.mm"
        return dateFormatter.string(from: self)
    }
}
