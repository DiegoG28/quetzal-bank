//
//  TransferViewModel.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 12/07/23.
//

import Foundation

class TransferViewModel: ObservableObject {
    private var accountService = AccountService()
    private var session = UserSession.shared
    
    @Published var transfer: TransferResponse? = nil
    @Published var message: String?
    @Published var errors: [String:String] = [:]

    
    func transfer(from origin: String, to destination: String, _ amount: Float?) async {
        do {
            self.message = nil
            
            if (!transferDataIsValid(origin, destination, amount)) {
                return
            }
            
            let transferRequest = TransferRequest(user_account: origin, receptor_account: destination, amount: amount!)
            
            let response = try await accountService.transfer(transferRequest: transferRequest)
            
            if (response.status == "Success") {
                DispatchQueue.main.async {
                    self.transfer = response.data
                }
                // 401 Could be for inssuficient funds, but we cover that case in our validation
            } else if (response.statusCode == 401) {
                errors["destinationNotFound"] = "Destination account not found"
            }
            
        } catch {
            self.message = "Error transfering"
        }
    }
    
    func transferDataIsValid (_ origin: String, _ destination: String, _ amount: Float?) -> Bool {
        var errors: [String: String] = [:]
        
        if (destination.isEmpty) {
            errors["emptyReceptor"] = "Please write a destination account"
        }
        
        if (amount == nil ) {
            errors["validAmount"] = "Please enter a valid amount"
        } else {
            if (session.account!.balance < Int(amount!)) {
                errors["notEnoughAmount"] = "Inssuficient funds"
            }
        }
        
        DispatchQueue.main.async {
            self.errors = errors
        }
        
        if (errors.count > 0) {
            return false
        }
        return true
    }
}
