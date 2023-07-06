//
//  SecondaryButton.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 06/07/23.
//

import Foundation
import SwiftUI

struct SecondaryButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? QColor.white : QColor.buttonBackground)
            .padding(10)
            .contentShape(Rectangle())
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 7)
                            .fill(QColor.buttonBackground)
                    } else {
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(QColor.buttonBackground, lineWidth: 2)
                            .saturation(1.8)
                    }
                }
            )
            .cornerRadius(7)
            .font(.NunitoRegular(size: 18))
            .frame(maxWidth: .infinity)
    }
}
