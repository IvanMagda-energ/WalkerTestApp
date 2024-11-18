//
//  EmptyStateView.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 11.11.2024.
//

import SwiftUI

struct EmptyStateView: View {
    var viewModel: StepsViewModel
    private let spacing: CGFloat = 30
    
    var body: some View {
        VStack(spacing: spacing) {
            Text("The data is missing...")
            
            Image("MissingDataImage")
            
            Button {
                Task {
                    await viewModel.loadStepsStatistic()
                }
            } label: {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("Try again")
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    EmptyStateView(viewModel: StepsViewModel())
}
