//
//  NError.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 18/11/21.
//  Copyright © Xamben. All rights reserved.
//

public enum NError: Error{
    case unauthorized
    case internalServerError
    case responseError(message: String)
    case incompleteInput
    case sourceNotFound
    case emptyResult
    case parseError
    case undefinedError
    case connectionProblem
    case invalidUrl(url: String)
}

public extension NError {
    var description: String {
        switch self {
        case .unauthorized:
            return "Ups! Your session has been expired. You'll be logged out."
        case .internalServerError:
            return "Internal Server Error, Please try again later."
        case let .responseError(message):
            return message
        case .incompleteInput:
            return "Incomplete input"
        case .undefinedError, .parseError:
            return "Something went wrong"
        case .sourceNotFound:
            return "Sorry Source Not Found"
        case .emptyResult:
            return "Empty Result"
        case .connectionProblem:
            return "Please check your network connection"
        case .invalidUrl(let url):
            return "Invalid URL format: \(url)"
        }
    }
}

extension NError: Equatable {
    public static func ==(lhs: NError, rhs: NError) -> Bool {
        switch (lhs, rhs){
        case (unauthorized, unauthorized):
            return true
        case (internalServerError, internalServerError):
            return true
        case (incompleteInput, incompleteInput):
            return true
        case (sourceNotFound, sourceNotFound):
            return true
        case (connectionProblem, connectionProblem):
            return true
        case (undefinedError, undefinedError):
            return true
        case (emptyResult, emptyResult):
            return true
        case (parseError, parseError):
            return true
        case (responseError, responseError):
            return true
        case (invalidUrl, invalidUrl):
            return true
        default:
            return false
        }
    }
}
