//
//  TitleModifier.swift
//  Black Dates
//
//  Created by Albert Khurshudyan on 20.12.23.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .font(.largeTitle)
            .foregroundStyle(Color.pink)
    }
}
