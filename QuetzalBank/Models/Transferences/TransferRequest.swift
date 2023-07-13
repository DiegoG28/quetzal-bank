//
//  TransferenceRequest.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 11/07/23.
//

import Foundation

struct TransferRequest: Codable {
    var user_account: String
    var receptor_account: String
    var amount: Float
}
