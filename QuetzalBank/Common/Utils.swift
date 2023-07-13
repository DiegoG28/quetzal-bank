//
//  Utils.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 12/07/23.
//

import Foundation

extension String {
    func splitCard(every chunkSize: Int) -> [String] {
        stride(from: 0, to: self.count, by: chunkSize).map {
            let start = self.index(self.startIndex, offsetBy: $0)
            let end = self.index(start, offsetBy: chunkSize, limitedBy: self.endIndex) ?? self.endIndex
            return String(self[start..<end])
        }
    }
}
