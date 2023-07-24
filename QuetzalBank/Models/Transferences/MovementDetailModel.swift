//
//  MovementDetail.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 23/07/23.
//

import Foundation

struct MovementDetailModel: Codable {
    let id: Int
    let id_sender: Int
    let id_receptor: Int
    let amount: Int
    let sender_account: String
    let receptor_account: String
}
