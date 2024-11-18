//
//  AddGoalView.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 11.11.2024.
//

import SwiftUI

struct AddGoalView: View {
    @Environment(\.dismiss)
    private var dismiss
    @State var goal: String = ""
    
    private let spacing: CGFloat = 16
    private let fraction = 0.3
    
    var body: some View {
        VStack(spacing: spacing) {
            TextField("Add your step goal", text: $goal)
                .textFieldStyle(.plain)
                .padding()
                .border(Color.secondary)
                .keyboardType(.numberPad)
            
            Button {
                if let goalInt = Int(goal) {
                    UserDefaults.standard.set(goalInt, forKey: UserDefaultKeys.myGoal)
                    dismiss()
                }
            } label: {
                Text("Save")
                    .padding()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .presentationDetents([.fraction(fraction)])
    }
}

#Preview {
    AddGoalView()
}
