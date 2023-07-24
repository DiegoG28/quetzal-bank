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
            ZStack(alignment: .topLeading) {
                QColor.background.ignoresSafeArea()
                VStack(alignment: .leading){
                    Text("Movements").titleFont.padding(.bottom,10)
                        .foregroundColor(QColor.white)
                    VStack(alignment: .center){
                        Image(systemName: "tag.circle")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(QColor.gradientText)
                            .padding(.bottom, 10)
                    }
                    
                    if let movementDetail = viewModel.movementDetail {
                        
                        VStack(alignment: .center){
                            Text("$"+String(movementDetail.amount))
                                .titleFont
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 20)
                        }
                        VStack(alignment: .leading){
                            Text("Destination account:").bodyFont
                                .foregroundColor(QColor.white).padding(.bottom,10)

                                Text(movementDetail.receptor_account)
                                .bodyFont
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(QColor.white)
                                .padding(10)
                                .background(QColor.textLabelBackground)
                                .cornerRadius(10)
                        }.padding(.bottom, 20)
                        
                        VStack(alignment: .leading){
                            Text("Origin account:").bodyFont
                                .foregroundColor(QColor.white).padding(.bottom,10)

                                Text(movementDetail.sender_account)
                                .bodyFont
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(QColor.white)
                                .padding(10)
                                .background(QColor.textLabelBackground)
                                .cornerRadius(10)
                        }.padding(.bottom, 20)
                    } else {
                        Text("Could not load data")
                            .foregroundColor(.gray)
                            .padding(10)
                    }
            }
                .padding()
        }
            
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

