//
//  Utils.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 10.11.2024.
//

import Foundation

enum EnvironmentInfo {
    static let bundleIdentifier: String = {
        guard let identifier = Bundle.main.bundleIdentifier else {
            fatalError("Plist file not found")
        }
        return identifier
    }()
}

