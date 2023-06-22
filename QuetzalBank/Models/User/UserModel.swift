//
//  User.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import Foundation

struct UserModel: Codable {
    let name: String
    let lastname: String
    let email: String
    let rfc: String
    let phone: String
    let password: String
    let id_bank: Int
    let id: Int
}
