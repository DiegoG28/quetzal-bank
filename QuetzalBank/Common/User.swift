//
//  User.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 06/07/23.
//

import Foundation

class User: ObservableObject {
    var name: String = ""
    var lastName: String = ""
    var email: String = ""
    var rfc: String = ""
    var phone: String = ""
    var password: String = ""
    var bankId: Int = 0
    var id: Int = 0

    
    init(name: String, lastName: String, email: String, rfc: String, phone: String, password: String, bankId: Int, id: Int){
        self.name = name
        self.lastName = lastName
        self.email = email
        self.rfc = rfc
        self.phone = phone
        self.password = password
        self.bankId = bankId
        self.id = id
    }
    
}
