//
//  Detail.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 24/07/23.
//

import SwiftUI

struct Detail: View {
    @ObservedObject private var viewModel = MovementsViewModel()
        
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                QColor.background.ignoresSafeArea()
                VStack(alignment: .leading){
                    Text("Movements").titleFont.padding(.bottom,10)
                        .foregroundColor(QColor.white)
                    Image(systemName: "tag.circle")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(QColor.gradientText)
                        .padding(.bottom, 10)
                    
                    if let movementDetail = viewModel.movementDetail {
                        
                        Text("$"+String(movementDetail.amount))
                            .titleFont
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 20)
                        VStack{
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
                        
                        VStack{
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
        
        }
    }


struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail()
    }
}
