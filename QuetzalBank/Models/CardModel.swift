//
//  CardModel.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 06/07/23.
//

import Foundation

struct CardModel: Codable, Hashable {
    let id: Int
    let id_account: Int
    let card: String
    let card_account: String
    let status: Int
}
