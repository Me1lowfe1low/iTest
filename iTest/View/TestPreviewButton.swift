//
//  TestPreviewButton.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 09.04.2023.
//

import SwiftUI

struct TestPreviewButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(UIColor.secondarySystemBackground))
            
        }
        //.frame(width: 150, height: 150)
        .padding()
    }
}

struct TestPreviewButton_Previews: PreviewProvider {
    static var previews: some View {
        TestPreviewButton()
    }
}
