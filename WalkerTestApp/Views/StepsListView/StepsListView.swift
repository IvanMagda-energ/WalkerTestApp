//
//  StepsListView.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 10.11.2024.
//

import SwiftUI

struct StepsListView: View {
    let steps: [StepInfo]
    let goal: Int
    
    var body: some View {
        List(steps) { step in
            StepsListRowView(step: step, goal: goal)
        }
        .listStyle(.plain)
    }
}

#Preview {
    StepsListView(
        steps: PreviewMockData.weeklySteps,
        goal: 5000
    )
}
