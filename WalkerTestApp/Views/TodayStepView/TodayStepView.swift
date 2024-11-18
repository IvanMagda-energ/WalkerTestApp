//
//  TodayStepView.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 10.11.2024.
//

import SwiftUI

struct TodayStepView: View {
    let step: StepInfo
    let viewHeight: CGFloat
    let goal: Int
    
    private let cornerRadius: CGFloat = 16
    private let opacity: CGFloat = 0.5
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .frame(maxWidth: .infinity)
            .frame(height: viewHeight)
            .foregroundStyle(step.count >= goal  ? .green.opacity(opacity) : .red.opacity(opacity))
            .overlay(alignment: .topLeading) {
                HStack {
                    Image(systemName: "flame")
                        .foregroundStyle(.red )
                    
                    Text("Steps")
                        .font(.body)
                    
                    Spacer()
                    
                    Text("Goal: \(goal)")
                        .font(.body)
                    
                    if step.count >= goal {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundStyle(.red)
                    }
                }
                .padding()
            }
            .overlay {
                HStack {
                    Image(systemName: "figure.walk")
                    Text(step.count.description)
                }
                .font(.title)
            }
            .overlay(alignment: .bottomTrailing) {
                Text(step.date.formatted(date: .abbreviated, time: .omitted))
                    .foregroundStyle(.secondary)
                    .font(.title2)
                    .padding()
            }
    }
}

#Preview {
    let viewHeight: CGFloat = 200
    let step = PreviewMockData.dayFourSteps
    TodayStepView(
        step: step,
        viewHeight: viewHeight,
        goal: 5000
    )
}
