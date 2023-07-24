//
//  MovementDetailView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 23/07/23.
//

import SwiftUI

struct MovementDetailView: View {
    @ObservedObject private var viewModel = MovementsViewModel()
    
    @Binding var movementId: Int
    
    var body: some View {
        VStack {
            Text("Movements")
                .titleFont
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            
            
            
            if let movementDetail = viewModel.movementDetail {
                
                Text("$"+String(movementDetail.amount))
                    .titleFont
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)

                
                Text(movementDetail.receptor_account)
                    .titleFont
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)
                
                Text(movementDetail.sender_account)
                    .titleFont
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)
            } else {
                Text("Could not load data")
                    .foregroundColor(.gray)
                    .padding(10)
            }
            
            Text("Movementss")
                .titleFont
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            
            Spacer()
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(QColor.background)
        .onAppear() {
            Task {
                await viewModel.fetchMovementDetail(movementId: movementId)
            }
        }
    }
}

