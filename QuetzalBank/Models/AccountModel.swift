//
//  AccountModel.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 06/07/23.
//

import Foundation
struct AccountModel: Codable {
    let id: Int
    let id_user: Int
    let balance: Int
    let status: Int
    let card: [CardModel]
    let user: UserModel
}
