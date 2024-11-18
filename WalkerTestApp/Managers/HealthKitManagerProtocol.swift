//
//  HealthKitManagerProtocol.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 10.11.2024.
//

import Foundation
import HealthKit

/// A protocol that defines the methods for interacting with HealthKit to fetch step count data and check authorization.
protocol HealthKitManagerProtocol {
    /// Asynchronously checks the HealthKit authorization status and throws an error if authorization is not granted.
    func checkAuthorization() async throws
    
    /// Asynchronously fetches the step count data for the current day and returns a `StepInfo` object.
    func fetchTodayStepCount() async throws -> StepInfo
    
    /// Asynchronously fetches the step count data for the past week and returns an array of `StepInfo` objects.
    func fetchWeeklyStepCounts() async throws -> [StepInfo]
}
