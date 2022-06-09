//
//  CustomResult.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 25/11/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation

public enum RemoteConfigResult {
    case upgrade(String)
}

public enum HomeResult{
    case failure(String)
    case success
    case logout
    case expired(String)
}
