//
//  HeaderComponent.swift
//  Black Dates
//
//  Created by Albert Khurshudyan on 18.12.23.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Capsule()
                .frame(width: 120, height: 6)
                .foregroundColor(Color.secondary)
                .opacity(0.2)

            Image("black_dates_small_logo")
                .resizable()
                .scaledToFit()
                .frame(height: 80)
        }
    }
}

#Preview {
    HeaderComponent()
}
