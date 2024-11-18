//
//  MockHealthKitManager.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 10.11.2024.
//

import Foundation

final class MockHealthKitManager: HealthKitManagerProtocol {
    /// A mock function that simulates checking HealthKit authorization status asynchronously.
    func checkAuthorization() async throws {}
    
    /// A mock function that simulates fetching step count data for the current day asynchronously.
    /// - Returns: A `StepInfo` object containing simulated data for today's step count.
    func fetchTodayStepCount() async throws -> StepInfo {
        return PreviewMockData.daySevenSteps
    }
    
    /// A mock function that simulates fetching step count data for the past week asynchronously.
    /// - Returns: An array of `StepInfo` objects containing simulated step count data for each day of the past week.
    func fetchWeeklyStepCounts() async throws -> [StepInfo] {
        return PreviewMockData.weeklySteps
    }
}
