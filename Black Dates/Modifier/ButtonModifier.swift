//
//  ButtonModifier.swift
//  Black Dates
//
//  Created by Albert Khurshudyan on 20.12.23.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Capsule().fill(Color.pink))
            .foregroundStyle(Color.white)
    }
}
