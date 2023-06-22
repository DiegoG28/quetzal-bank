//
//  APIResponse.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 21/06/23.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let status: String
    let message: String
    let data: T
}
