//
//  APIResponse.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 21/06/23.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let status: String?
    let message: String?
    let data: T?
    let errors: [APIError]?
    let access_token: String?
}

struct APIError: Codable {
    var property: String
    var constraints: APIErrorConstraints
}

struct APIErrorConstraints: Codable {
    var minLength: String?
}
