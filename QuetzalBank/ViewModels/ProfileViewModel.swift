//
//  ProfileViewModel.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 17/07/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    private var accountService = AccountService()
    
    @Published var message: String?
    
    func updateAccountData(accountData: UserUpdateRequest) async {
        do {
            try await accountService.updateAccountData(accountData: accountData)
            print("piola")
        } catch {
            print(error)
            self.message = "Error updating account"
        }
    }
    
}
