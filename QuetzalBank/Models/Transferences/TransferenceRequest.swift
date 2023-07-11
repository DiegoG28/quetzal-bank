//
//  TransferenceRequest.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 11/07/23.
//

import Foundation

struct TransferenceRequest: Codable {
    let user_account: String
    let receptor_account: String
    let amount: Int
}
