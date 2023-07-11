//
//  MovementsView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 11/07/23.
//

import SwiftUI

struct MovementsView: View {
    var body: some View {
        VStack{
            Text("Movements")
                .titleFont
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            Text("Mayo 2023")
                .subtitleFont
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)
            GroupBox{
                HStack{
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 50)
                        .foregroundColor(.gray)
                        .padding(.trailing, 5)
                    
                    VStack(alignment: .leading){
                        Text("APPLE")
                        Text("15:56")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    Text("-$123,000.00")
                
                }.frame(maxWidth: .infinity,maxHeight: 50)
                    .foregroundColor(QColor.white)

                   
            }.groupBoxStyle(TransparentGroupBox())
            Spacer()
           
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color("Background"))
        
    }
    struct TransparentGroupBox: GroupBoxStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.content
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius:8)
                    .fill(QColor.textFieldBackground))
                .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
        }
    }
}

struct MovementsView_Previews: PreviewProvider {
    static var previews: some View {
        MovementsView()
    }
}
