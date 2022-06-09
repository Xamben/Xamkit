//
//  Service.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 18/11/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation
import Alamofire

public protocol Service {
  func request<T: Codable>(of type: T.Type,
                           with url: String,
                           withMethod method: HTTPMethod?,
                           withHeaders headers: HTTPHeaders,
                           withParameter parameters: Parameters,
                           withEncoding encoding: ParameterEncoding?,
                           completion: @escaping(Result<T, ErrorMessage>) -> Void)
}

public protocol LocalService {
  func parsingJSON<T>(of type: T.Type, from data: Data) -> Result<T, ErrorMessage> where T: Codable
  func loadJsonFromFile(with url: String) -> Data
}
