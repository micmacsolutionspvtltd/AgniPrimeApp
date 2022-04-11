//
//  NetworkError.swift
//  Fustionkitchen
//
//  Created by Macintosh HDD on 04/10/21.
//  Copyright © 2021 fusionpos. All rights reserved.
//

import Foundation
import UIKit

struct ErrorConstants {
    static let genericErrorMessage = "Error Occurred. Please try again in sometime."
    static let serverError = "Server failed to process your request"
    static let badRequest = "Unable to process your request. Please try again."
    static let resourceNotFound = "Please try again later (Resource Not Found)."
}


enum NetworkError: Error {
    case noInternetAccess
    case unAuthorised
    case requestTimedOut
    case badRequest
    case serverError (reason: String)
    case unknown(reason: String)
}

extension NetworkError: CustomStringConvertible {
    var description: String {
        switch self {
        case .noInternetAccess: return "Please check your internet connection and try again"
        case .unAuthorised: return "Session Expired. Please sign in again"
        case .requestTimedOut: return "Request timed out"
        case .badRequest: return ErrorConstants.badRequest
        case .serverError (let reason): return "\(ErrorConstants.serverError) (\(reason)). Please try again."
        case .unknown(let reason): return reason
        }
    }

    var localizedDescription: String {
        return self.description
    }

}
