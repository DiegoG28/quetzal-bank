//
//  IconButon.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 07/07/23.
//

import SwiftUI

struct IconButton: ButtonStyle {
    let gradient = LinearGradient(colors: [Color(.blue), Color(.purple)],
                                  startPoint: .topLeading,
                                  endPoint: .bottomTrailing)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? QColor.white : QColor.gradientText)
            .padding(20)
            .contentShape(Circle())
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(gradient)
                    } else {
                        Circle()
                            .stroke(gradient, lineWidth: 2)
                            .saturation(1.8)
                    }
                }
            )
            .font(.NunitoRegular(size: 18))
    }
}
