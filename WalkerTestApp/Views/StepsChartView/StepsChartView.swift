//
//  StepsChartView.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 11.11.2024.
//

import SwiftUI
import Charts

struct StepsChartView: View {
    let steps: [StepInfo]
    let goal: Int
    private let cornerRadius: CGFloat = 12
    
    var body: some View {
        Chart {
            ForEach(steps, id: \.id) { step in
                BarMark(
                    x: .value("Date", step.date, unit: .day),
                    y: .value("Steps", step.count)
                )
                .annotation(position: .top, alignment: .center) {
                    Text("\(step.count)")
                        .font(.caption)
                }
                .cornerRadius(cornerRadius)
                .foregroundStyle(step.count >= goal ? .green : .red)
            }
        }
    }
}

#Preview {
    StepsChartView(
        steps: PreviewMockData.weeklySteps,
        goal: 5000
    )
}
