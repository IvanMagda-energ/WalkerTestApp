//
//  HealthKitManagerError.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 10.11.2024.
//

import Foundation

/// An enumeration that represents the possible errors related to HealthKit authorization and data availability.
enum HealthKitManagerError: Error {
    ///Indicates that the authorization status for HealthKit is unknown.
    case unknownAuthorizationStatus
    /// Indicates that HealthKit authorization has been denied.
    case authorizationStatusIsDenied
    /// Indicates that HealthKit data is not available.
    case healthDataIsNotAvailable
}
