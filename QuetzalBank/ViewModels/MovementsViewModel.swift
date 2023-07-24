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
    @Published var movementDetail: MovementDetailModel? = nil
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
            print(error)
            DispatchQueue.main.async {
                self.message = "Error fetching movements"
            }
        }
    }
    
    func fetchMovementDetail (movementId: Int) async {
        do {
            print("Fetching movement detail")
            let response = try await accountService.getMovementDetail(movementId: movementId)
            if (response.status == "Success") {
                DispatchQueue.main.async {
                    self.movementDetail = response.data
                }
            }
        } catch {
            print(error)
            DispatchQueue.main.async {
                self.message = "Error fetching movement detail"
            }
        }
    }
    
}
