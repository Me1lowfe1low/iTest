//
//  AnswersOptions.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 08.04.2023.
//

import SwiftUI

struct AnswersOptions: View {
    @State var title: String
    @Binding var checked: Bool
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Button(action: { self.checked.toggle() } )
            {
                Image(systemName: checked ? "square" : "xmark.app")
            }
        }
        .padding(.horizontal)
    }
}

struct AnswersOptions_Previews: PreviewProvider {
    static var previews: some View {
        AnswersOptions(title: "Multiple questions", checked: .constant(true))
    }
}
