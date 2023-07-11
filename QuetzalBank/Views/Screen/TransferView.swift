//
//  Transfer.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 06/07/23.
//

import SwiftUI

struct Transfer: View {
    @State var origin: String = ""
    @State var destination: String = ""
    @State var amount: String = ""
    @State var balance: Float = 0.00
    var body: some View {
        ZStack(alignment: .topLeading) {
            QColor.background.ignoresSafeArea()
            Spacer()
            VStack(alignment: .leading) {
                Text("Transfer").titleFont.padding(.bottom,10)
                    .foregroundColor(QColor.white)
                HStack {
                    Text("Your current balance is").bodyFont.foregroundColor(QColor.white)
                    Text("$" + String(balance)).foregroundColor(QColor.textLabelBackground)
                }
                .padding(.bottom,20)
                
                CustomTextField(text: $origin, placeholder: "Origin account").padding(.bottom,10)
                    .foregroundColor(QColor.white)
                CustomTextField(text: $destination, placeholder: "Destination account")
                    .padding(.bottom,20).foregroundColor(QColor.white)
                
                Text("How much do you want to transfer?").bodyFont.padding(.bottom,10)
                    .foregroundColor(QColor.white)
                
                CustomTextField(text: $amount, placeholder: "Amount")
                
                Spacer()
                VStack() {
                    Button{
                       
                    } label: {
                        Text("Transfer").subtitleFont
                            .frame(maxWidth: .infinity)
                    }.buttonStyle(MainButton())
                }
            }
            .padding()
        }
    }
}

struct Transfer_Previews: PreviewProvider {
    static var previews: some View {
        Transfer()
    }
}
