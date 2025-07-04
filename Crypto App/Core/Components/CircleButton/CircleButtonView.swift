//
//  CircleButtonView.swift
//  Crypto App
//
//  Created by Arman on 2/7/25.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50,height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 3
                    
            )
            .padding()
    }
}

#Preview {
    CircleButtonView(iconName: "info")
}
#Preview {
    CircleButtonView(iconName: "plus").colorScheme(.dark)
}

