//
//  StepsViewModel+Extensions.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 11.11.2024.
//

import Foundation

extension StepsViewModel {
    enum ViewModelLocalizedError: LocalizedError {
        case error(Error)
        case permissionsIsNotGranted
        
        public var errorDescription: String? {
            switch self {
            case .error:
                return "Something went wrong."
            case .permissionsIsNotGranted:
                return "Permissions is not granted"
            }
        }
        
        public var failureReason: String? {
            switch self {
            case .error(let error):
                return error.localizedDescription
            case .permissionsIsNotGranted:
                return "App need access to read step count data."
            }
        }
        
        public var helpAnchor: String? {
            switch self {
            case .error:
                return "Please try again"
            case .permissionsIsNotGranted:
                return "You can allow access in settings."
            }
        }
        
        public var recoverySuggestion: String? {
            switch self {
            default:
                return "OK"
            }
        }
    }
}
