//
//  MovementsViewModel.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 11/07/23.
//

import Foundation

class MovementsViewModel: ObservableObject {
    private var accountService = AccountService()
    
    @Published var movements: [MovementModel]? = nil
    @Published var message: String?
    
    func fetchMovements () async {
        do {
            let response = try await accountService.getMovements()
            if (response.status == "Success") {
                DispatchQueue.main.async {
                    self.movements = response.data
                }
            }
        } catch {
            print("asdf")
            print(error)
            DispatchQueue.main.async {
                self.message = "Error fetching movements"
            }
        }
    }
    
}
