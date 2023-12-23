//
//  CardTransition.swift
//  Black Dates
//
//  Created by Albert Khurshudyan on 23.12.23.
//

import SwiftUI

extension AnyTransition {
    static var trailingButton: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    
    static var leadingButton: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
}
