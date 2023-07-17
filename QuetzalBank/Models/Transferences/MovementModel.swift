//
//  MovementModel.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 11/07/23.
//

import Foundation

struct MovementModel: Codable {
    let id: Int
    let id_sender: Int
    let id_receptor: Int
    let amount: Float
    let sender_account: String
    let receptor_account: String
}
