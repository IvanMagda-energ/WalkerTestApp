//
//  StepsProgressView.swift
//  WalkerTestApp
//
//  Created by Ivan Magda on 11.11.2024.
//

import SwiftUI

struct StepsProgressView: View {
    let size: CGFloat
    
    private let opacity: CGFloat = 0.3
    private let cornerRadius: CGFloat = 16
    private let scaleEffect: CGFloat = 3
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(opacity)
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(width: size, height: size)
                .foregroundStyle(.secondary)
            
            ProgressView()
                .scaleEffect(scaleEffect)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    StepsProgressView(size: 100)
}
