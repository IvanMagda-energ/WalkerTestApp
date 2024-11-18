//
//  StatisticType.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 11.11.2024.
//

import Foundation

/// Enumeration that defines the available views for displaying step statistics, either as a list or a chart.
enum StatisticType: CaseIterable {
    /// Displays statistics in a list format. The associated icon is "list.bullet".
    case list
    /// Displays statistics in a chart format. The associated icon is "chart.bar.xaxis".
    case chart
    
    /// A computed property that returns the appropriate SF Symbol string for each case.
    var icon: String {
        switch self {
        case .list:
            "list.bullet"
        case .chart:
            "chart.bar.xaxis"
        }
    }
}
