//
//  Transfer.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 06/07/23.
//

import SwiftUI

struct TransferView: View {
    @Environment(\.dismiss) private var dismiss
    
    
    
    @ObservedObject private var session = UserSession.shared
    @ObservedObject private var viewModel = TransferViewModel()
    
    @State private var activeCardIndex: Int = 0
    @State private var origin: String = ""
    @State private var destination: String = "0862273220212024"
    @State private var amount: String = ""
    
    let numberFormatter: NumberFormatter
    
    init() {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
    }
    
    var body: some View {
        
        let cards = session.account?.card ?? []
        
        ZStack(alignment: .topLeading) {
            QColor.background.ignoresSafeArea()
            Spacer()
            VStack(alignment: .leading) {
                Text("Transfer").titleFont.padding(.bottom,10)
                    .foregroundColor(QColor.white)
                HStack {
                    Text("Your current balance is").bodyFont.foregroundColor(QColor.white)
                    Text("$\(numberFormatter.string(from: NSNumber(value: session.account?.balance ?? 0)) ?? "0.00")")
                        .foregroundColor(QColor.gradientText)
                    
                }
                .padding(.bottom,20)
                
                Group {
                    Text("Origin account:").bodyFont
                        .foregroundColor(QColor.white).padding(.bottom,10)
                    VStack {
                        TabView(selection: $activeCardIndex) {
                            ForEach(0..<cards.count, id: \.self) { index in
                                Text(cards[index].card.splitCard(every: 4).joined(separator: " ")).bodyFont
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(QColor.white)
                                    .padding(10)
                                    .background(QColor.textLabelBackground)
                                    .cornerRadius(10)
                            }.padding(.horizontal, 5)
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    }
                    .frame(height: 50)
                    .padding(.bottom, 10)
                }
                
                
                Group {
                    if let error = viewModel.errors["emptyReceptor"] {
                        Text(error).smallFont.foregroundColor(QColor.errorText).padding(.bottom, 5).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    if let error = viewModel.errors["destinationNotFound"] {
                        Text(error).smallFont.foregroundColor(QColor.errorText).padding(.bottom, 5).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    TextField("", text: $destination, prompt:
                                Text("Destination account")
                        .foregroundColor(.white).bodyFont)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.bottom, 10)
                }
                
                
                
                
                Group {
                    Text("How much do you want to transfer?").bodyFont.padding(.bottom,10)
                        .foregroundColor(QColor.white)
                    
                    if let error = viewModel.errors["validAmount"] {
                        Text(error).smallFont.foregroundColor(QColor.errorText).padding(.bottom, 5).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    if let error = viewModel.errors["notEnoughAmount"] {
                        Text(error).smallFont.foregroundColor(QColor.errorText).padding(.bottom, 5).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    TextField("", text: $amount, prompt:
                                Text("Amount")
                        .foregroundColor(.white).bodyFont)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.bottom, 10)
                }
                
                
                Spacer()
                VStack() {
                    Button{
                        origin = cards[activeCardIndex].card
                        print(amount)
                        print(origin)
                        print(destination)
                        
                        Task {
                            origin = cards[activeCardIndex].card
                            await viewModel.transfer(from: origin, to: destination, Float(amount))
                            if (viewModel.errors.count > 0 || viewModel.message != nil) {
                                return
                            }
                            dismiss()
                        }
                        
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

struct CardOptionView: View {
    var card: CardModel
    @Binding var selectedCard: CardModel
    
    var body: some View {
        Text(card.card)
            .padding(10)
            .background( QColor.textFieldBackground)
            .foregroundColor(QColor.white)
            .cornerRadius(7)
            .font(.NunitoRegular(size: 16))
            .onTapGesture {
                selectedCard = card
            }
    }
}

struct Transfer_Previews: PreviewProvider {
    static var previews: some View {
        TransferView()
    }
}
