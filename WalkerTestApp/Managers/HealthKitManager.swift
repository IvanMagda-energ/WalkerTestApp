//
//  HealthKitManager.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 10.11.2024.
//

import Foundation
import HealthKit
import os


final class HealthKitManager: HealthKitManagerProtocol {
    private let logger = Logger(
        subsystem: EnvironmentInfo.bundleIdentifier,
        category: String(
            describing: HealthKitManager.self
        )
    )
    
    private let healthStore: HKHealthStore
    private let stepCountQuantityType = HKQuantityType(.stepCount)
    
    private init(healthStore: HKHealthStore = HKHealthStore()) {
        self.healthStore = healthStore
        
    }
    
    /// Checks and requests authorization to access the user’s health data if needed.
    func checkAuthorization() async throws {
        logger.info("\(#function) Start checking authorization")
        // Make sure User's heath Data is Available
        guard HKHealthStore.isHealthDataAvailable() else {
            logger.error("User's Heath Data is not Available.")
            throw HealthKitManagerError.healthDataIsNotAvailable
        }
                
        let dataToRead = Set([stepCountQuantityType])
        
        // Check authorization status
        let status = healthStore.authorizationStatus(for: stepCountQuantityType)
        switch status {
        case .notDetermined:
            logger.info("Authorization status is: notDetermined.")
            try await healthStore.requestAuthorization(toShare: dataToRead, read: dataToRead)
        case .sharingAuthorized:
            logger.info("Authorization status is: sharingAuthorized, no need to do anything.")
            break
        case .sharingDenied:
            logger.info("Authorization status is: sharingDenied.")
            throw HealthKitManagerError.authorizationStatusIsDenied
        @unknown default:
            throw HealthKitManagerError.unknownAuthorizationStatus
        }
    }
    
    /// Fetches the total step count for the current day.
    /// - Returns: A `StepInfo` object containing the total step count and start date for today, or `nil` if no data is available.
    func fetchTodayStepCount() async throws -> StepInfo {
        logger.info("\(#function) Start fetching today step count statistic")
        var dailyStepInfo: StepInfo?
        
        // To get the day's steps, start from midnight and end now
        let dateEnd = Date.now
        let dateStart = Calendar.current.startOfDay(for: .now)
        
        // To get daily steps data
        let dailyInterval = DateComponents(day: 1)
        
        let dateRangePredicate = HKQuery.predicateForSamples(withStart: dateStart, end: dateEnd, options: .strictStartDate)
        let stepCountPredicate = HKSamplePredicate.quantitySample(type: HKQuantityType(.stepCount), predicate: dateRangePredicate)
        
        let stepQueryDescriptor = HKStatisticsCollectionQueryDescriptor(
            predicate: stepCountPredicate, options: .cumulativeSum, anchorDate: dateStart, intervalComponents: dailyInterval
        )
        
        let result = try await stepQueryDescriptor.result(for: healthStore)
        
        // From the daily steps data, get today's step count samples
        result.enumerateStatistics(from: dateStart, to: dateEnd) { statistics, _ in
            // Sum up all step samples for the day
            dailyStepInfo = StepInfo(count: Int(statistics.sumQuantity()?.doubleValue(for: .count()) ?? 0), date: dateStart)
        }
        
        // Daily StepInfo is missing return step info with 0 count.
        guard let dailyStepInfo else {
            return StepInfo(count: 0, date: Date())
        }
        
        return dailyStepInfo
    }
    
    /// Fetches the daily step counts for the past week.
    /// - Returns: An array of `StepInfo` objects, each containing the step count and date for a specific day in the past week.
    func fetchWeeklyStepCounts() async throws -> [StepInfo] {
        logger.info("\(#function) Start fetching weekly step count statistic")
        var steps = [StepInfo]()
        
        let dateEnd = Date.now
        let dateStart = Calendar.current.date(byAdding: .day, value: -7, to: Date.now)!
        
        let dailyInterval = DateComponents(day: 1)
        let dateRangePredicate = HKQuery.predicateForSamples(withStart: dateStart, end: dateEnd)
        let stepCountPredicate = HKSamplePredicate.quantitySample(type: stepCountQuantityType, predicate: dateRangePredicate)
        
        let stepQueryDescriptor = HKStatisticsCollectionQueryDescriptor(
            predicate: stepCountPredicate,
            options: .cumulativeSum,
            anchorDate: dateEnd,
            intervalComponents: dailyInterval
        )
        
        // Fetch the step count statistics for the specified date range
        let result = try await stepQueryDescriptor.result(for: healthStore)
        result.enumerateStatistics(from: dateStart, to: dateEnd) { statistics, _ in
                if let stepCount = statistics.sumQuantity()?.doubleValue(for: .count()) {
                    let step = StepInfo(count: Int(stepCount), date: statistics.startDate)
                    if step.count > 0 {
                        steps.append(step)
                    }
                } else {
                    self.logger.warning("\(#function) No step count data for date: \(statistics.startDate)")
                }
            }
            
            logger.info("\(#function) Successfully retrieved \(steps.count) days of step data")
        return steps
    }
}

extension HealthKitManager {
    /// Creates an instance of `HealthKitManagerProtocol` for managing HealthKit operations.
    /// - Returns: An instance conforming to `HealthKitManagerProtocol`. Returns a `MockHealthKitManager` during previews; otherwise, returns a `HealthKitManager`.
    static func createManager() -> HealthKitManagerProtocol {
        if ProcessInfo.isOnPreview() {
            return MockHealthKitManager()
        } else {
            return self.init()
        }
    }
}

