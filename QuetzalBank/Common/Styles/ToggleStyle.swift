//
//  ToggleStyle.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 07/07/23.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    let gradient = LinearGradient(colors: [Color(.blue), Color(.purple)],
                                  startPoint: .topLeading,
                                  endPoint: .bottomTrailing)
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Rectangle()
                .fill(Color.clear)
                .frame(width: 51, height: 31, alignment: .center)
                .background(configuration.isOn ? AnyView(gradient) : AnyView(Color.gray))
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .overlay(
                            Rectangle()
                                .fill(Color.clear)
                                .background(configuration.isOn ? AnyView(gradient) : AnyView(Color.gray))
                                .mask(
                                    Image(systemName: configuration.isOn ? "faceid" : "circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .font(Font.title.weight(.black))
                                        .frame(width: 8, height: 8, alignment: .center)
                                )
                        )
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                        .animation(Animation.linear(duration: 0.1))
                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
    
    
    
}
