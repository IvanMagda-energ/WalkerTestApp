//
//  WalkerTestAppMainView.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 10.11.2024.
//

import SwiftUI

@main
struct WalkerTestAppMainView: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                StepsView()
            }
        }
    }
}
