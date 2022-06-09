//
//  Environment.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 24/01/22.
//  Copyright © 2022 Xamben. All rights reserved.
//

import Foundation

enum Environment {
    static let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "0"
    static let build = Bundle.main.infoDictionary?["CFBundleVersion"] ?? "0"
}
