//
//  StepInfo.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 10.11.2024.
//

import Foundation

struct StepInfo: Identifiable {
    let id = UUID()
    let count: Int
    let date: Date
}

extension StepInfo: Comparable {
    static func < (lhs: StepInfo, rhs: StepInfo) -> Bool {
        lhs.date > rhs.date
    }
    
    
}
