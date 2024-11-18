//
//  StatisticTypePickerView.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 11.11.2024.
//

import SwiftUI

struct StatisticTypePickerView: View {
    @Binding var selection: StatisticType
    
    var body: some View {
        Picker("", selection: $selection) {
            ForEach(StatisticType.allCases, id: \.self) { item in
                Image(systemName: item.icon)
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    StatisticTypePickerView(selection: .constant(.list))
}
