//
//  CardStyleModifier.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import SwiftUI

struct CardStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .clipped()
            )
    }
}
