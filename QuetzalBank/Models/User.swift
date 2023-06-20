//
//  User.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import Foundation

struct User: Codable {
    var name: String
    var lastname: String
    var email: String
    var rfc: String
    var phone: String
    var password: String
    var id_bank: Int
    var id: Int?
}
