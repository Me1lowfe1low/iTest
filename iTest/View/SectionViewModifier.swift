//
//  SectionViewModifier.swift
//  iTest
//
//  Created by Дмитрий Гордиенко on 09.04.2023.
//

import SwiftUI

struct SectionViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .padding(.horizontal)
    }
}
