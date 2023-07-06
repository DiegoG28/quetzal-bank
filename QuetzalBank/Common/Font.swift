//
//  Font.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 06/07/23.
//

import SwiftUI

extension Font {
    static func NunitoRegular(size: CGFloat) -> Font {
        Font.custom("Nunito-Regular", size: size)
    }
    
    static func NunitoSemiBold(size: CGFloat) -> Font {
        Font.custom("Nunito-SemiBold", size: size)
    }
}

extension Text {
    var titleFont: Text {
        self.font(.NunitoSemiBold(size: 24)).foregroundColor(QColor.white)
    }
    
    var subtitleFont: Text {
        self.font(.NunitoSemiBold(size: 18)).foregroundColor(QColor.white)
    }
    
    var buttonFont: Text {
        self.font(.NunitoRegular(size: 18)).foregroundColor(QColor.white)
    }
    
    var bodyFont: Text {
        self.font(.NunitoRegular(size: 16)).foregroundColor(QColor.white)
    }
    
    var smallFont: Text {
        self.font(.NunitoRegular(size: 14)).foregroundColor(QColor.white)
    }
}
