//
//  UserSession.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 06/07/23.
//

import Foundation

class UserSession: ObservableObject {
    @Published var isLoggedIn = false
    @Published var token: String? = nil
    @Published var account: AccountModel? = nil
    
    static let shared = UserSession()
    
    private init () {}
}
