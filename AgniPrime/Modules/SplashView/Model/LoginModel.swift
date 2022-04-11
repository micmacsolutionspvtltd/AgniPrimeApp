//
//  LoginModel.swift
//  AgniPrime
//
//  Created by MAC on 02/04/22.
//

import Foundation

struct LoginPageModelElement: Codable {
    let status, otp: String
}

typealias LoginPageModel = [LoginPageModelElement]
