//
//  Movements.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 06/07/23.
//

import SwiftUI

struct Movements: View {
   
    var body: some View {
        VStack{
            Text("Movements")
                .titleFont
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 30)
            Text("Mayo 2023")
                .subtitleFont
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(3)
            GroupBox{
                HStack{
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 50)
                        .foregroundColor(.gray)
                    
                    VStack{
                        Text("APPLE")
                        Text("15:56")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    Text("-$123,000.00")
                
                }.frame(maxWidth: .infinity,maxHeight: 50)
                    .foregroundColor(QColor.white)
                
              
                
                   
            }.groupBoxStyle(TransparentGroupBox())
            Spacer()
           
        }.frame(maxHeight: .infinity)
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

struct Movements_Previews: PreviewProvider {
    static var previews: some View {
        Movements()
    }
}
