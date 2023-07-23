//
//  UserUpdateRequest.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 17/07/23.
//

import Foundation

struct UserUpdateRequest: Codable {
    var name: String
    var lastname: String
    var email: String
    var rfc: String
    var phone: String
}
