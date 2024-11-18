//
//  StepsListRowView.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 10.11.2024.
//

import SwiftUI

struct StepsListRowView: View {
    let step: StepInfo
    let goal: Int
    
    private let circleSize: CGFloat = 10
    
    var body: some View {
        HStack {
            Circle()
                .frame(maxWidth: circleSize, maxHeight: circleSize)
                .foregroundStyle(step.count >= goal ? Color.green : Color.red)
            
            Text(step.count.description)
            
            Spacer()
            
            Text(step.date.formatted(date: .abbreviated, time: .omitted))
        }
    }
}

#Preview {
    StepsListRowView(
        step: PreviewMockData.dayFiveSteps,
        goal: 5000
    )
}
