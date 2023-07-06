//
//  GradientButtonStyle.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 06/07/23.
//

import SwiftUI

struct GradientButton: ButtonStyle {
    let gradient = LinearGradient(colors: [Color(.blue), Color(.purple)],
                                  startPoint: .topLeading,
                                  endPoint: .bottomTrailing)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? QColor.white : QColor.gradientText)
            .padding(10)
            .contentShape(Rectangle())
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 7)
                            .fill(gradient)
                    } else {
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(gradient, lineWidth: 2)
                            .saturation(1.8)
                    }
                }
            )
            .cornerRadius(7)
            .font(.NunitoRegular(size: 18))
            .frame(maxWidth: .infinity)
    }
}

