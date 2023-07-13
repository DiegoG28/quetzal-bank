//
//  MovementsView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 11/07/23.
//

import SwiftUI

struct MovementsView: View {
    @ObservedObject private var viewModel = MovementsViewModel()
    
    var body: some View {
        VStack {
            Text("Movements")
                .titleFont
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            
            ScrollView {
                Text("Mayo 2023")
                    .subtitleFont
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                
                GroupBox {
                    if let movements = viewModel.movements {
                        ForEach(movements, id: \.id) { movement in
                            MovementRowView(movement: movement)
                        }
                    } else {
                        Text("No movements found")
                            .foregroundColor(.gray)
                            .padding(10)
                    }
                }
                .groupBoxStyle(TransparentGroupBox())
                
            }
            Spacer()
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color("Background"))
        .onAppear() {
            Task {
                await viewModel.fetchMovements()
            }
        }
    }
}

struct MovementRowView: View {
    let movement: MovementModel
    
    var body: some View {
        HStack {
            Image(systemName: "tag.circle")
                .resizable()
                .frame(width: 40)
                .foregroundColor(.gray)
                .padding(.trailing, 5)
            
            VStack(alignment: .leading) {
                Text("Apple")
                Text("15:32")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("$" + String(movement.amount))
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .foregroundColor(QColor.white)
    }
}

struct TransparentGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(QColor.textFieldBackground)
            )
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
    }
}

struct MovementsView_Previews: PreviewProvider {
    static var previews: some View {
        MovementsView()
    }
}
