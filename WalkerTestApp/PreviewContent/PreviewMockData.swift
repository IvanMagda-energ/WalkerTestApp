//
//  PreviewMockData.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 10.11.2024.
//

import Foundation

struct PreviewMockData {
    static let weeklySteps = [
        dayOneSteps,
        dayTwoSteps,
        dayThreeSteps,
        dayFourSteps,
        dayFiveSteps,
        daySixSteps
    ]
    
    static let dayOneSteps = StepInfo(
        count: Int.random(in: 1000...10000),
        date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!
    )
    static let dayTwoSteps = StepInfo(
        count: Int.random(in: 1000...10000),
        date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!
    )
    static let dayThreeSteps = StepInfo(
        count: Int.random(in: 1000...10000),
        date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!
    )
    static let dayFourSteps = StepInfo(
        count: Int.random(in: 1000...10000),
        date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!
    )
    static let dayFiveSteps = StepInfo(
        count: Int.random(in: 1000...10000),
        date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!
    )
    static let daySixSteps = StepInfo(
        count: Int.random(in: 1000...10000),
        date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    )
    static let daySevenSteps = StepInfo(
        count: Int.random(in: 1000...10000),
        date: Date()
    )
}
