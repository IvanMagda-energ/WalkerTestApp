//
//  StepsView.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 11.11.2024.
//

import SwiftUI

struct StepsView: View {
    @AppStorage(UserDefaultKeys.myGoal) private var goal = 0
    @State private var viewModel = StepsViewModel()
    @State var stepStatisticType: StatisticType = .list
    @State var isShowAddGoalView = false
    
    var body: some View {
        GeometryReader { geometry in
            Group {
                if viewModel.weeklySteps.isEmpty {
                    EmptyStateView(viewModel: viewModel)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                } else {
                    VStack {
                        if let todaySteps = viewModel.weeklySteps.first {
                            TodayStepView(step: todaySteps, viewHeight: geometry.size.height/4, goal: goal)
                        }
                        
                        StatisticTypePickerView(selection: $stepStatisticType)
                        
                        switch stepStatisticType {
                        case .list:
                            StepsListView(steps: viewModel.weeklySteps, goal: goal)
                        case .chart:
                            StepsChartView(steps: viewModel.weeklySteps, goal: goal)
                        }
                    }
                    .padding()
                    .navigationTitle("Walker Test App")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                isShowAddGoalView.toggle()
                            } label: {
                                HStack {
                                    Text("Add goal")
                                    Image(systemName: "plus.circle")
                                }
                            }
                            
                        }
                    }
                    .sheet(isPresented: $isShowAddGoalView) {
                        AddGoalView()
                    }
                }
            }
            .overlay {
                if viewModel.isLoading {
                    StepsProgressView(size: min(geometry.size.width, geometry.size.height) / 4)
                }
            }
            .task {
                await viewModel.loadStepsStatistic()
            }
            .alert(
                isPresented: $viewModel.hasError,
                error: viewModel.error
            ) { error in
                if let recoverySuggestion = error.recoverySuggestion {
                    Button(recoverySuggestion, role: .cancel) {}
                } else {
                    Button("OK", role: .cancel) {}
                }
            } message: { error in
                if let failureReason = error.failureReason {
                    Text(failureReason + "\n" + (error.helpAnchor ?? ""))
                } else {
                    Text("Unknown error")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        StepsView()
    }
}
