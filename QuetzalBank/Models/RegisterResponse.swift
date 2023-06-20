//
//  RegisterResponse.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import Foundation

struct RegisterResponse: Codable {
    let status: String
    let message: String
    let data: User
}
