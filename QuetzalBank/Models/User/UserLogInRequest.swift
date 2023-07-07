//
//  UserLoginRequest.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 03/07/23.
//

import Foundation

struct UserLoginRequest: Codable {
    var phone: String
    var password: String
}
