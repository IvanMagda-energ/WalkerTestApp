//
//  StepsViewModel.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 11.11.2024.
//

import Foundation
import Observation
import os

@Observable
final class StepsViewModel {
    private let logger = Logger(
        subsystem: EnvironmentInfo.bundleIdentifier,
        category: String(describing: StepsViewModel.self)
    )
    
    var weeklySteps: [StepInfo] = []
    var isLoading = false
    var error: ViewModelLocalizedError?
    var hasError = false
    
    private let healthKitManager: HealthKitManagerProtocol
    
    init(healthKitManager: HealthKitManagerProtocol = HealthKitManager.createManager()) {
        self.healthKitManager = healthKitManager
    }
    
    /// Asynchronously loads step statistics for the current week and today's step count from HealthKit, updates the UI states, and handles errors.
    @MainActor
    func loadStepsStatistic() async {
        logger.info("\(#function) Start load step statistic")
        defer {
            isLoading = false
        }
        
        isLoading = true
        
        do {
            try await healthKitManager.checkAuthorization()
            var weeklySteps = try await healthKitManager.fetchWeeklyStepCounts()
            let todaySteps = try await healthKitManager.fetchTodayStepCount()
            weeklySteps.append(todaySteps)
            self.weeklySteps = weeklySteps.sorted()
            logger.info("\(#function) Successful load step statistic for \(self.weeklySteps.count) days")
        } catch HealthKitManagerError.authorizationStatusIsDenied {
            self.error = .permissionsIsNotGranted
            self.hasError = true
            logger.error("Permission is denied")
        } catch {
            self.error = .error(error)
            self.hasError = true
            logger.error("\(error)")
        }
    }
}
