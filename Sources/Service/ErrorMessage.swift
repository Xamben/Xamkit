//
//  ErrorMessage.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 18/11/21.
//  Copyright © Xamben. All rights reserved.
//

// Error Code
//-------------
// -1: Failure
// -2: Cant Define error
// -3: Data Not Found
// -4: Parse Error
// -5: Uknown Error
//

public struct ErrorMessage: Error {
  let code: Int
  let description: String
}
